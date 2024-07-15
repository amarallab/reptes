////
////  SwiftUIView.swift
////  
////
////  Created by Heliodoro Tejedor Navarro on 5/28/22.
////
//
//import SwiftUI
//import PhotosUI
//
//struct PhotoPicker: UIViewControllerRepresentable {
//    let configuration: PHPickerConfiguration
//    @Binding var isPresented: Bool
//    
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        let controller = PHPickerViewController(configuration: configuration)
//        controller.delegate = context.coordinator
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: PHPickerViewControllerDelegate {
//        private let parent: PhotoPicker
//        
//        init(_ parent: PhotoPicker) {
//            self.parent = parent
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            print(results)
//            parent.isPresented = false // Set isPresented to false because picking has finished.
//        }
//    }
//}
//
//fileprivate struct DynPhotoPicker: View {
//    let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
//    @State var isPresented = false
//
//    var body: some View {
//        PhotoPicker(configuration: configuration, isPresented: $isPresented)
//    }
//}
//
//struct ImagePicker_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        DynPhotoPicker()
//    }
//}
