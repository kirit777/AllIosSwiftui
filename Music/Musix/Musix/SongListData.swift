//
//  SongListData.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import Foundation
import SwiftUI
import UIKit

func getSongs()->NSMutableArray{
    let arr = NSMutableArray()
    arr.add(createDict(index: "0", name: "Coke Studio | Season 14 | Pasoori | Ali Sethi x Shae Gill", img: "img1", url: "https://dl115.dlmate19.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ0hsOTQvakNNM0ZLOUZxY1prNU9HaE1NWkJaZlpiaHNHU0VNMWIraXpST3B1cVBBYkNoWjB5U25ySzc1ME9zVDdLdUtrcFZjVS9Xd2FyM2VDcW1qUkptUWJoZG9XSVI1NVBZbUp2dGtKbWxuUzF3ZUdIL0VmZTRUai9nUmltZlNZMS96RllHOUh4djVKWWhpL01hdmk1K3I1RHFENlA2NGhNenZtUXNWeW5sZXBtNFlzbUNoUWdOWUpZMzZYMjEvWFByaHBJeG9vVndFajUvYmJ4VXM1c1QrT05iMnAwUEhBPQ%3D%3D"))
    
    arr.add(createDict(index: "1",name: "Apna Bana Le - Bhediya | Varun Dhawan, Kriti Sanon| Sachin-Jigar, Arijit Singh", img: "img2", url: "https://dl253.dlmate03.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ0ZpTnM3akRJaUQ2b0hpb2hrbk1hb0pzMUdONlpFaHJ5akE4dGF2aHJRY01lS1BrU2lwSkV5U3ppeTl0Z3l0M1Q4OG8wb1VNZGJYeEg1aWEyQ2hEaDhnQk8rVGRIREVyQWRUSHB5dDBGaDIyMnh4UERBclJUN3UzeS92a3pOWVRSWjlEMENNZkR2NFo1YzNUU09QZEg5M0lVUnVDU2FwOGh2MStETzhWUFFsdmRzbnZsNVpFSndSc1VKK29xdGtmM2M5Z0VlaFpaQjgyUGlyUHEyRDR3d0NLeVRmR29oYUhwUnNMaTdEa05LaVRjYi9sTzkvcW9tNVQxWU43Tjg4bWZwcXFHNVAyclBLSVRsV2N5QUtMMD0%3D"))
    
    arr.add(createDict(index: "2",name: "Maiyya Mainu - Lyrical | Jersey | Shahid Kapoor,", img: "img3", url: "https://dl153.dlmate08.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ0ptZHdqM2hGb0xLcEZxSmhrbk1pNU1jQk1MNnRFaHFDbkE4MVI3SFdUUXRpS09BYU4vYk1uVW55TzVaMFFxeXJCOG9KcmJjRndYUVBxME5XaWxUbHpuVGYwYk5uQUJibEViRHhJcTBWdjN5T1doN3J6dGdMc3NuRG1rd09PZkhkTXRESUhPTXJBOEl0QWlDeVpTZTdyeG9RUXJ5UGFzTHhFeXFQWTVpZnlodUFZb1l0WWFSTndLNVpmaUtPNzB1Q2Y0MEFjajhRMTlBdWhzZkt2RkpzaEZhaWJKR1ltWm5wUXZydThDRWxZM1NBWXgyKzI4Nnd1c3pGUFlxbHY3VC9ub0tPNU1tbk9PTkhnRXBXR2U3bz0%3D"))
    
    arr.add(createDict(index: "3",name: "Qaafirana | Kedarnath | Sushant Rajput | Sara Ali Khan | Arijit Singh & Nikhita | Amit Trivedi", img: "img4", url: "https://dl204.dlmate68.xyz/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ1ZtZFE4emdJaUQ2b0g3YVlxMCtXeUxjaGJKdXhFL3AreEdkOWE0WFhxY05xYkpSdkMvYXNuVUhMSzF0bzA4aFRIOG9CckV1aGpYeHp4ajYyUW56OXhnVXkrVU5IR0hiRkNiRHd3Z2sxcXgyMm4zdmpDdkJIeC9YQzk5QXVGWlNnUGpTc0tLZjJOdE0xdXpHYmVlK0xtMXRWWGl5dVBzZDhiL1BiWTVpZnZrYjgvck5rN1hVdDVPTjBXeUp2MDJmbmVwRWtZdjVJWjNreTJwK095RHFFbUNiYVdlRGxrQVRBSTQvLzZTQ1FOempjZngyMnkvNUF1NW1FSFRxRm40V2k5N2MzNmJ6R2ZkdjM0UnBxTUkveThtY1QwNisxZXExUElzT2JEbGFWNm13dUZhNUd5VWZBd25BRXVzZkRGNHNrNW4zK1huQW9Da3VrYndWLzFla2xnSDhFVGV5NVljNWhHVUdnS3JzdmQ2cTQ1L3BRUlB3cnc2cVkwS3F4dCtzK1lrK0pkMURqZjlOMXJZZz09"))
    
    arr.add(createDict(index: "4",name: "Main Rahoon Ya Na Rahoon Full Video | Emraan Hashmi, Esha Gupta | Amaal Mallik, Armaan Malik", img: "img5", url: "https://dl257.dlmate20.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ0ptZHcwakNJaUNhUkRxTVlXMXErT0lvSjlMNjhBd29UcE44dFkrWFh1ZU5TT1AwVENrNVUwUTNLUHZQNDhxamZDK3NVRlNzRndIVEh0aS9LaTNYcFhoQWIwY3BQZ0ZMUmFaSHd3Z2xKdTBpZWRoOXpWdFJ6ei9YQzk5QXVGWlNnUGpTc0tLZjJOdE0xdXpHYmVlK0xtMXRWWGl5dVBzZDhiL1BYWTVpZlMwK1F5dXRoNlRsWk9JOTVReWNtejJQWEQrRzQzeHB3RXlrUzJyUGF2QzV0b1RmUEdJVzRuYW5aUnZxbjlXUjBoekMwYisyZmpwK2syNTNvTUxQWWd2enJzb2FhdmRTbkZlc0Nq"))
    
    arr.add(createDict(index: "5",name: "Kun Faya Kun Full Video Song Rockstar | Ranbir Kapoor | A.R. Rahman, Javed Ali, Mohit Chauhan", img: "img6", url: "https://dl212.dlmate61.xyz/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ1BqZHR4NFJFNkFPQm5zNE5rOGZHc0w0SjVKNk1Ld3NHUkh0QlR2Z3pYY3R1WUpBNmIvZE1VUTMyRC9zUjJrajdmL0lFeUVvSlFaRjNLbXU2dWx6ODlvd2JqZTl5R05MUmZKbHAwcTBsM21BV2J6ZVRjdUJ1MnZtMys0VXVLWUNFMW9qb2ZOYWlWbzdsUjJuemZldlhobHNJam9EYk1wOGh2akxYUGtoaWt6ck1xdlpKMlVVay9QdHRXekpUSzJmSFZwSGdTbFpjajNGaW9wZDJ3RDVvd0U1cU5kamwzQVRBRzZ1VDhTQm9NOERjZjltNjM1SkF1NzNBR2ZySks2WENMNi9QaGF6NldRY2ozV1pTQUZlbXhyL3IwN2ZGb3EzN0NydUxTbEp0T3FUeitIUGpYVGNRUnRVdzA3NjZUdG9veHgxbms4eUZjaC9nWnpWbjVZMFV3UzhvYWRTOVhmcHREVW5oQjdkL243NWsvOVpwUFpSR3lwYTg0YmY5Zys4K2VtT05QbjJpUjVvSStNbDJW"))
    
    arr.add(createDict(index: "6",name: "Kabira Full Song Yeh Jawaani Hai Deewani | Pritam | Ranbir Kapoor, Deepika Padukone", img: "img7", url: "https://dl214.dlmate07.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ1BtZGN6MVJGb0o3NUFxc1ljMk9xbmFQQktKdXdsekoyakVOQmR2aGJaZUp1dk5RcWV0NVl2Q1RpeDVkOHB1REtFdUx3aFY4dDRSRjNUbXZhc21TTTlyUUx3YnRIR0ZQTm1iSE51cUU5dDFtaWUzS0tTdnh6MHRrSzlwbG1MTVdGWWxDSUVLT0hGODVvTmgwL0dmNlNoZ2JaUTZIUzU2TEpuOU4yWDRRUFk4cVZ3dGN3bUdFTnhmTTEwOTl6d3grREZ0MElOaVpRWmh4enk4YnIvVWNwalJQYllhekoyQVNFQjdPemtBVXBZM0N3RS9USHFwdmx5dnpkZE43Tmp0V2Eycmc9PQ%3D%3D"))
    
    arr.add(createDict(index: "7",name: "Balam Pichkari Full Song Video Yeh Jawaani Hai Deewani | PRITAM | Ranbir Kapoor, Deepika Padukone", img: "img8", url: "https://dl184.dlmate20.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ0dtZGs3eWxzVENLaEVyWXc5M3ErR05zVkRaWlFBdzQzcEo5ZFE4REdUU05XRGV5V0lvWmtuVEhySzM5YzA4aHZLOXBraFY4QTZIU2JLc3RLQ3Uzbzl1d2I3Zk5IZlhwTlhmWGgwc1F0SDFpT0R4ZnJWOGlYNXQyaW1xRU9HSWlrYTRYME5OUG5Wem85SndXR1dLcVhDeXA4UXVUT2Q1OThiL1AyTjUwU2s1Yk43NnZwc0RFbDFaNVVUMnBYNGxMMkhwMFlWZ1pRanlrU25vZW1uRkpjS0dyQ1NkUWhqTVN3TzF2bm1XQjRSOER3YjhGTzA5N2drNzI0QVRxaDA0VjJ3L1BmK1p6R1JRZExrUm9XRko5ZXZwOHY3Nit0ZXRFRFJxZXpWbzU1Rmt4aXVROG5BVnRBTXBFUXNyNmE4dGZzaThIaWV6dzB0cGNGSHlWdXZNVXM0UWNwaURURUtQOXdlRlNzTW9zRG50UGRxcGNjVk9SaTBzZTUzWmY4N2twM0R4TGtRbW4vRTQ5WWdOVkdSc3lIZkR0Mm1HblpwN3pKUkNRPT0%3D"))
    
    arr.add(createDict(index: "8",name: "Senorita Zindagi Na Milegi Dobara Full HD Video Song | Farhan Akhtar, Hrithik Roshan, Abhay Deol", img: "img9", url: "https://dl205.dlmate03.online/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ1huZHMxMVJrM0FPQjJyNE1yMXVPcGFPZE9aWW9Hd1krbEdKVncranpaWTlIQUZocUZ1dE1PWmppMy90STR0blQ4L0lBbkVvSlhWd1R3bXVqb3R6cCtuUWJuTmZEZkhLeGVaSHd3a1U5dzJ5ZWRoOURXc1JUaCtGbW9xRUhOWVRSWjlEMENNZkR2NFo1YzNUU09QZEg5M0lVUnVDU2FwOGh2MStETzhWUFFtL2RzbnNVblUwVmdkdDVlMXBlK2tydmZvRWtXa3BBSTIzSytvT3lpQjVrOEk2dWZSanA1TWljTzRORHJVeGtmM1NRaC9ubXkrcEF0Nmw4ZmVLUnc1MTJuOXZ6dVdUbVpiTXIzUWE2RkllQ3BwOWZHNnV0b3EwbklyZHpWazRsSWx3YVlTY3IzUjhnM3RVb3NyWnlhd2RwbTlXVys0aVVzaGE0RTFCaTZjRWt5RTc1bFpYSVhOOFVGQWpvUnBzaS91UEJrcGNZYk9odTZzZm9qY3Z3Q3JwYk93ckZHbG1pUitjVS9iVitTdFNMVkJkcTRUM01pdGpRQ0NBPT0%3D"))
    
//        arr.add(createDict(name: "", img: "img10", url: ""))
//
//        arr.add(createDict(name: "", img: "img11", url: ""))
//
//        arr.add(createDict(name: "", img: "img12", url: ""))
//
//        arr.add(createDict(name: "", img: "img13", url: ""))
    
    return arr
}

func createDict(index:String,name:String,img:String,url:String)->NSMutableDictionary{
    let dict = NSMutableDictionary()
    dict["index"] = index
    dict["name"] = name
    dict["image"] = img
    dict["url"] = url
    return dict
}
