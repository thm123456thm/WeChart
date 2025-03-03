import { TabBarClass } from '../model/Tab'
import connect from './connect'



@Entry
@Component
struct Index {
  @State currentIndex:number = 0
  @State tabBarlist: TabBarClass[] = [
    {
      icon: $r('app.media.ic_public_voice3'),
      name: 'wechat',
      title: '微信',
      selectIcon: $r('app.media.ic_public_switch_camera')
    },
    {
      icon: $r('app.media.ic_public_voice3'),
      name: 'connect',
      title: '联系人',
      selectIcon: $r('app.media.ic_public_switch_camera')
    },
    {
      icon: $r('app.media.ic_public_voice3'),
      name: 'discover',
      title: '发现',
      selectIcon: $r('app.media.ic_public_switch_camera')
    },
    {
      icon: $r('app.media.ic_public_voice3'),
      name: 'my',
      title: '我的',
      selectIcon: $r('app.media.ic_public_switch_camera')
    }
  ]

  @Builder
  CommonTabBar(item: TabBarClass){
    Column(){
      Image(this.tabBarlist[this.currentIndex].name == item.name? item.selectIcon:item.icon)
        .width(20)
        .height(20)

      Text(item.title)
        .fontSize(12)
        .fontColor(this.tabBarlist[this.currentIndex].name == item.name? $r("app.color.primary"):$r("app.color.text_primary"))
        .margin({
          top: 5
        })
    }

  }

  build() {
    Column(){
      Tabs({index: $$this.currentIndex}){
        ForEach(this.tabBarlist,(item:TabBarClass)=>{
          TabContent(){
            if(item.name == "wechat"){
              Text("微信")
            }else if(item.name == "connect"){
              connect()
            }else if(item.name == "discover"){
              Text("发现")
            }else {
              Text("我的")
            }

          }.tabBar(this.CommonTabBar(item))
        })

      }
      .barPosition(BarPosition.End)
      .animationDuration(300)

    }
    .width("100%")
    .height("100%")


  }
}