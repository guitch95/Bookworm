//
//  RatingView.swift
//  Bookworm
//
//  Created by Guillaume Richard on 04/03/2026.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            // On loop sur 5 étoiles maxi et on ajoute plus 1 car on débute à 1 et pas zéro.
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    // Chaque étoile représente un number et en cliquant dessus ce nombre devient le rating. Logique puisque si je clique sur la 3ème étoile par exemple c'est que je considére que le livre vaut 3 étoiles.
                    rating = number
                } label: {
                    image(for: number)
                        // Si le nombre actuel est supérieur à mon rating alors étoile grise sinon jaune.
                        .foregroundStyle(number > rating ? offColor : onColor)
                }

            }
        }
        // Permet de cliquer réellement et précisément sur l'étoile que l'on souhaite.
        // Sinon tout le lien dans une List est cliquable et ce n'est pas le comportement que l'on souhaite ici.
        .buttonStyle(.plain)

    }
    // Ma fonction ici sert à définir l'image.
    func image(for number: Int) -> Image {
        if number > rating {
            // Si offImage a une valeur alors ça sera celle de onImage donc l'étoile sinon ça reste nil
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
