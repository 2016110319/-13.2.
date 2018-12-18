//
//  ViewController.swift
//  实验13.2.
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 liyuting. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //声明两个属性
    var webView: WKWebView!
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置根视图的背景颜色
        self.view.backgroundColor = UIColor.white
        //获取屏幕的宽度和高度
        let width = self.view.frame.width
        let height = self.view.frame.height
        //设置按钮的宽度和高度
        let buttonHeight: CGFloat = 40
        let buttonWidth: CGFloat = width / 5
        
        //初始化webView，并默认加载百度网页
        webView = WKWebView(frame: CGRect(x: 0, y: (buttonHeight + 10) * 2, width: width, height: height - (buttonHeight + 10) * 2))
        self.view.addSubview(webView)
        loadURL(path: "www.baidu.com")
        
        //添加文本输入框，并设置默认的占位符为百度的网址
        textField = UITextField(frame: CGRect(x: 10, y: buttonHeight + 20, width: width / 5 * 4, height: buttonHeight))
        textField.placeholder = "www.baidu.com"
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.returnKeyType = .done
        self.view.addSubview(textField)
        
        ///添加按钮
        //搜索按钮
        let searchBtn = UIButton(frame: CGRect(x: buttonWidth * 4 + 10, y: buttonHeight + 20, width: buttonWidth - 10, height: buttonHeight))
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.setTitleColor(UIColor.cyan, for: .normal)
        searchBtn.setTitleColor(UIColor.brown, for: .highlighted)
        searchBtn.addTarget(self, action: #selector(searchWeb), for: .touchUpInside)
        self.view.addSubview(searchBtn)
        
        //返回按钮
        let backBtn = UIButton(frame: CGRect(x: 10, y: 20, width: buttonWidth, height: buttonHeight))
        backBtn.setTitle("<", for: .normal)
        backBtn.setTitleColor(UIColor.cyan, for: .normal)
        backBtn.setTitleColor(UIColor.brown, for: .highlighted)
        backBtn.addTarget(self, action: #selector(backWeb), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        //下一步按钮
        let forwardBtn = UIButton(frame: CGRect(x: 20 + buttonWidth, y: 20, width: buttonWidth, height: buttonHeight))
        forwardBtn.setTitle(">", for: .normal)
        forwardBtn.setTitleColor(UIColor.cyan, for: .normal)
        forwardBtn.setTitleColor(UIColor.brown, for: .highlighted)
        forwardBtn.addTarget(self, action: #selector(forwardWeb), for: .touchUpInside)
        self.view.addSubview(forwardBtn)
        
        //刷新按钮
        let freshBtn = UIButton(frame: CGRect(x: 30 + buttonWidth * 2, y: 20, width: buttonWidth, height: buttonHeight))
        freshBtn.setTitle("⟳", for: .normal)
        freshBtn.setTitleColor(UIColor.cyan, for: .normal)
        freshBtn.setTitleColor(UIColor.brown, for: .highlighted)
        freshBtn.addTarget(self, action: #selector(freshWeb), for: .touchUpInside)
        self.view.addSubview(freshBtn)
        
    }
    
    //定义一个加载网页的方法，用于webView加载网页
    func loadURL(path: String) {
        let url: URL?
        if path.hasPrefix("http://") {
            url = URL(string: path)
        } else {
            url = URL(string: "http://\(path)")
        }
        if url != nil {
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
    
    ///实现按钮功能
    @objc func freshWeb() {
        webView.reload()
    }
    
    @objc func forwardWeb() {
        webView.goForward()
    }
    
    @objc func backWeb() {
        webView.goBack()
    }
    
    @objc func searchWeb() {
        let path = textField.text ?? ""
        loadURL(path: path)
    }
    
    //实现点击键盘的done按钮之后关闭键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

