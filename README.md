# iOS 面试题

## 1.动画(CoreAnimation)

### 1. 在一个动画的执行过程中，实时打印出当前正在做动画的属性的值

> 分析：iOS 动画的是通过CALayer实现的 ,而CALayer动画的具体显示是由内部三层layer 共同决定的
>
> 1. modelLayer:存储当前layer的最终变化值。修改CALayer的可动画属性时候，ModelLayer上面的属性立即生效
> 2. **presentationLayer:存储的是是当前正在动画的属性的近似值,随着动画过程不断改变**。
> 3. renderLayer:存储的是当前动画的真实值，这个api不对外开发。

所以在动画过程中，由于我们无法获取renderLayer，我们转而通过presentationLayer来获取当前在正在动画的属性的值	。(见demo01)

```swift
       @IBAction func changeAlpha(_ sender: UIButton) {
        
       let targetAlpha:CGFloat = 0.0;
       let timer =  Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
        print("presentLayer is:",sender.layer.presentation()!.opacity,"modelaLayeris :", sender.layer.model().opacity,"layer is:", sender.layer.opacity)
        }

        UIView.animate(withDuration: 3, animations: {
            sender.alpha = targetAlpha;
        }) { _ in
            timer.invalidate()
        }
    }

```













参考 [iOS 动画 - 认识 CoreAnimation](https://juejin.im/entry/575cc58d207703006ad6637f)







