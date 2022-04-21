//
//  LocalVideo.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/22.
//

import Foundation

class VideoModel {
    
    // 6개의 비디오를 담고 있는 배열 videos 생성.
    let videos = [
        video("videoScreenshot01", "Introduce 3DS Mario", "Youtube - 06:32"),
        video("videoScreenshot02", "Emoji Among Us", "Vimeo - 3:34"),
        video("videoScreenshot03", "Seals Documentary", "Vimeo - 0:06"),
        video("videoScreenshot04", "video 4", "test - 1:11"),
        video("videoScreenshot05", "video 5", "test - 2:22"),
        video("videoScreenshot06", "video 6", "test - 3:33")
    ]
    
    // 비디오 정보를 담고 있는 구조체 video 생성.
    struct video {
        let videoImagePath: String
        let videoLabel: String
        let videoInfo: String
        
        init(_ videoImagePath: String, _ videoLabel: String, _ videoInfo: String) {
            self.videoImagePath = videoImagePath
            self.videoLabel = videoLabel
            self.videoInfo = videoInfo
        }
    }
    
}
