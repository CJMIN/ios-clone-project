//
//  LoginViewController.swift
//  OpenAPI
//
//  Created by 최정민 on 2021/03/01.
//


import UIKit

import KakaoSDKAuth
import KakaoSDKUser

//final public class AuthApi{
//
//    public static let shared = AuthApi()
//
//}




class LoginViewController: UIViewController {
    
    
    @IBAction func onKakaoLoginByAppTouched(_ sender: Any) {
            // 카카오톡 설치 여부 확인
            if (AuthApi.isKakaoTalkLoginAvailable()) {
                AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        // 예외 처리 (로그인 취소 등)
                        print(error)
                    }
                    else {
                        print("loginWithKakaoTalk() success.")
                        // do something
                        _ = oauthToken
                        // 어세스토큰
                        let accessToken = oauthToken?.accessToken
                        
                        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                        self.setUserInfo()
                    }
                }
            }
            
        }

    @IBAction func login(_ sender: Any) {
        
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {

                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    
                    let accessToken = oauthToken?.accessToken
                    
                    self.setUserInfo()
                }
            
        }
    }
    
    func setUserInfo() {
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    //do something
                    _ = user
//                    self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
                    
                    if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                        let data = try? Data(contentsOf: url) {
//                        self.profileImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
        
        
//        // 카카오톡 설치 여부 확인
//        if (AuthApi.isKakaoTalkLoginAvailable()) {
//            AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
        
        
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
    }

}

