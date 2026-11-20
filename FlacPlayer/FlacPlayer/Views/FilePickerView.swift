import SwiftUI
import UniformTypeIdentifiers

struct FilePickerView: View {
    @State private var showFilePicker = false
    @State private var selectedFiles: [URL] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Select FLAC Files")
                .font(.title2)
                .bold()

            Button(action: { showFilePicker = true }) {
                Label("Choose Files", systemImage: "folder")
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if !selectedFiles.isEmpty {
                List(selectedFiles, id: \.self) { file in
                    Text(file.lastPathComponent)
                }
            }
        }
        .padding()
        .fileImporter(
            isPresented: $showFilePicker,
            allowedContentTypes: [.audio],
            allowsMultipleSelection: true,
            onCompletion: handleFileSelection
        )
    }

    func handleFileSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            selectedFiles = urls
            print("Selected \(urls.count) files")
        case .failure(let error):
            print("File selection error: \(error)")
        }
    }
}

#Preview {
    FilePickerView()
}
