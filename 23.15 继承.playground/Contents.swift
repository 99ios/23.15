//: Playground - noun: a place where people can play

import UIKit

//基类
class Person{
    var name:String, age:Int
    init() {
        name = "person"
        age = 1
    }
    func toString() {
        print("name:\(name),age:\(age)",terminator:",")
    }
}

let p = Person()
p.toString() //打印：name:person,age:1

//子类化
class Student:Person{
    var studentId:Int
    convenience init(name:String,age:Int) {
        self.init()
        super.name = name
        super.age = age
    }
    override init() {
        studentId = 0
    }
    override var age: Int{
        get{
            return super.age
        }
        set{
            super.age = max(8,newValue)
        }
    }
    
    override func toString() {
        super.toString()
        print("studentId:\(studentId)")
    }
}

let student = Student(name: "Liming", age: 18)
student.studentId = 100
student.toString() //打印结果：name:Liming,age:18,studentId:100
student.age = 6
student.toString() //打印：name:Liming,age:20,studentId:100



//防止覆盖
class Person2{
    var name:String, age:Int
    init() {
        name = "person"
        age = 1
    }
    func toString() {
        print("name:\(name),age:\(age)",terminator:",")
    }
    final func addAge(add:Int){
        age += add
    }
}

class Teacher:Person2{
    /*//报错，final方法无法被覆盖
     override func addAge(add:Int){
     }
     */
    override func toString() {
        super.toString()
        print("teacher")
    }
}
let teacher = Teacher()
teacher.addAge(add: 10)
teacher.toString()     //打印：name:person,age:11,teacher