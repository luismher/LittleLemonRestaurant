//
//  ImagePicker.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI
import Foundation


        struct ImagePicker: UIViewControllerRepresentable {
            @Binding var image: UIImage?
            @Binding var isPresented: Bool
            
            func makeCoordinator() -> Coordinator {
                return Coordinator(self)
            }

            func makeUIViewController(context: Context) -> UIImagePickerController {
                let picker = UIImagePickerController()
                picker.delegate = context.coordinator
                return picker
            }

            func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

            class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
                var parent: ImagePicker

                init(_ parent: ImagePicker) {
                    self.parent = parent
                }

                func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                    if let uiImage = info[.originalImage] as? UIImage {
                        parent.image = uiImage
                    }

                    picker.dismiss(animated: true, completion: nil)
                    parent.isPresented = false
                }

                func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                    picker.dismiss(animated: true, completion: nil)
                    parent.isPresented = false
        }
    }
}
