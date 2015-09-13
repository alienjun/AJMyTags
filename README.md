# MyTags
用于表现修改个人标签，使用UICollectionView实现，动态背景框使用UICollectionViewFlowLayout的DecorationView实现。


![Aaron Swartz](https://github.com/alienjun/MyTags/blob/master/Sceenshots/screenshot1.gif)

1.其中利用UICollectionView的特性，实现了标签插回原位的效果。


2.为了能利用UICollectionView动画特性，未选中和选中的标签在同一个UICollectionView中表现；这里会导致背景框跟随标签高度变化成了难点，好在UICollectionViewFlowLayout 提供了一个DecorationView 解决了此问题。

欢迎一起交流技术学习。

微博：[AlienJunX](http://weibo.com/alienjunx)

特别感谢：

<https://github.com/s-atif-jamil/CollectionSectionView>
