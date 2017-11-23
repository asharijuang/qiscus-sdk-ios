//
//  QRoom+PublicAPI.swift
//  Qiscus
//
//  Created by Ahmad Athaullah on 21/11/17.
//  Copyright © 2017 Ahmad Athaullah. All rights reserved.
//
import RealmSwift
import SwiftyJSON

public extension QRoom {    
    
    // MARK: - Class method
    public class func all() -> [QRoom]{
        return QRoom.allRoom()
    }
    public class func unpinAll(){
        QRoom.unpinAllRoom()
    }
    public class func room(withId id:String) -> QRoom? {
        return QRoom.getRoom(withId: id)
    }
    public class func room(withUniqueId uniqueId:String) -> QRoom? {
        return QRoom.getRoom(withUniqueId:uniqueId)
    }
    public class func room(withUser user:String) -> QRoom? {
        if Thread.isMainThread {
            return QRoom.getSingleRoom(withUser: user)
        }else{
            return nil
        }
    }
    public class func addRoom(fromJSON json:JSON)->QRoom{
        return QRoom.addNewRoom(json:json)
    }
    public class func deleteRoom(room:QRoom){
        QRoom.removeRoom(room: room)
    }
    
    // MARK: - Object method
    public func pin(){
        self.pinRoom()
    }
    public func unpin(){
        self.unpinRoom()
    }
    public func commentGroup(index:Int)->QCommentGroup?{
        return self.getCommentGroup(index:index)
    }
    public func update(roomName:String? = nil, roomAvatarURL:String? = nil, roomOptions:String? = nil, onSuccess:@escaping ((_ room: QRoom)->Void),onError:@escaping ((_ error: String)->Void)){
        self.updateRoom(roomName: roomName, roomAvatarURL: roomAvatarURL, roomOptions: roomOptions, onSuccess: onSuccess, onError: onError)
    }
    public func publishStopTyping(){
        self.publishStopTypingRoom()
    }
    public func publishStartTyping(){
        self.publishStartTypingRoom()
    }
    public func saveAvatar(image:UIImage){
        self.saveRoomAvatar(image: image)
    }
    public func subscribeRealtimeStatus(){
        self.subscribeRoomChannel()
    }
    public func unsubscribeRealtimeStatus(){
        self.unsubscribeRoomChannel()
    }
    public func sync(){
        self.syncRoom()
    }
    public func loadMore(){
        self.loadMoreComment()
    }
    public func updateCommentStatus(inComment comment:QComment, status:QCommentStatus){
        self.updateStatus(inComment: comment, status: status)
    }
    public func publishCommentStatus(withStatus status:QCommentStatus){
        self.publishStatus(withStatus: status)
    }
}
