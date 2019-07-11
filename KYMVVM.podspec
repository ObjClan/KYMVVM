Pod::Spec.new do |s|
  s.name         = "KYMVVM" # 项目名称
  s.version      = "1.0.4"        # 版本号 与 你仓库的 标签号 对应
  s.license      = "MIT"          # 开源证书
  s.summary      = "私人pod代码" # 项目简介

  s.homepage     = "https://github.com/ObjClan/KYMVVM.git" # 仓库的主页
  s.source       = { :git => "https://github.com/ObjClan/KYMVVM.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
  s.source_files = "KYMVVM/Classes/*.{h,m}" # Classes 文件夹下所有的.h和.m文件
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "9.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  s.dependency   'JSONModel', '~> 1.7.0' # 依赖库
  s.dependency   'Masonry', '~> 1.1.0'
  s.dependency   'ReactiveObjC', '~> 3.1.0'
  s.dependency   'MJRefresh', '~> 3.1.15.6'
  # User
  s.author             = { "OBjClan" => "OBjClan@gmail.com" } # 作者信息
  #s.social_media_url   = "www.test.com" # 个人主页
  s.subspec 'Base' do |ss|
    ss.source_files = 'KYMVVM/Classes/Base/*'
    ss.subspec 'Model' do |sss|
        sss.source_files = 'KYMVVM/Classes/Base/Model/*'
    end
    ss.subspec 'View' do |sss|
        sss.source_files = 'KYMVVM/Classes/Base/View/*'
        sss.dependency 'KYMVVM/Base/Protocol'
    end
    ss.subspec 'Controller' do |sss|
        sss.source_files = 'KYMVVM/Classes/Base/Controller/*'
        sss.dependency 'KYMVVM/Base/ViewModel'
        sss.dependency 'KYMVVM/Base/View'
    end
    ss.subspec 'ViewModel' do |sss|
        sss.source_files = 'KYMVVM/Classes/Base/ViewModel/*'
        sss.dependency 'KYMVVM/Base/Model'
    end
    ss.subspec 'Protocol' do |sss|
        sss.source_files = 'KYMVVM/Classes/Base/Protocol/*'
    end
  end
end
