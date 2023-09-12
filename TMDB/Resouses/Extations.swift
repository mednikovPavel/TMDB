//
//  Extations.swift
//  TMDB
//
//  Created by Pavel Mednikov on 12/09/2023.
//

import Foundation

extension String{
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
