//
//  Glob.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 30/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

class Glob {
  
  static func expand(pattern: String) -> [String] {
    var files = [String]()
    var gt: glob_t = glob_t()

    if (glob(pattern.cStringUsingEncoding(NSUTF8StringEncoding)!, 0, nil, &gt) == 0) {
      
      for (var i: Int32 = 0 ; i < gt.gl_matchc ; i++) {
        
        files.append(String(CString: gt.gl_pathv[Int(i)], encoding: NSUTF8StringEncoding)!)
      }
      
    }
    
    globfree(&gt);
    return files
  }
  
}
