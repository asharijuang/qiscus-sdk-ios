//
//  QCommentDelegate.swift
//  Example
//
//  Created by Ahmad Athaullah on 7/18/16.
//  Copyright © 2016 Ahmad Athaullah. All rights reserved.
//

import UIKit

public protocol QCommentDelegate {
    func didSuccesPostComment(comment:QiscusComment)
    func didFailedPostComment(comment:QiscusComment)
    func downloadingMedia(comment:QiscusComment)
    func didDownloadMedia(comment: QiscusComment)
    func didUploadFile(postData:QProgressData)
    func uploadingFile(progressData:QProgressData)
    func didFailedUploadFile(data:QPostData)
    func didSuccessPostFile(data:QPostData)
    func didFailedPostFile(data:QPostData)
    func finishedLoadFromAPI(data: QSyncNotifData?)
    func gotNewComment(comments:[QiscusComment])
    func didFailedLoadDataFromAPI(error: String)
}

