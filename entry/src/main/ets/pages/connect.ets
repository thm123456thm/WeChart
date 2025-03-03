import { DefaultUserList, UserInfo } from '../model/Users'
import { router, Router } from '@kit.ArkUI'

@Component
struct connect {
  @State filterList:UserInfo[] = []
  @State
  @Watch("filterName")
  searchName:string = ''

  aboutToAppear(): void {
    this.filterList = DefaultUserList
  }
//筛选联系人方法
  filterName(){
    this.filterList = DefaultUserList.filter((user:UserInfo) => {
      return user.username.includes(this.searchName)

      })
  }

  build() {
    Column(){
      //搜索栏
      Row(){
        Search({placeholder: "搜索",value: $$this.searchName})
          .backgroundColor($r("app.color.white"))
          .height(30)
          .borderRadius(4)
      }
      .width("100%")
      .padding({
        left: 10,
        right: 10

      })
      //联系人列表
      List(){
        ForEach(this.filterList,(item:UserInfo)=>{
          ListItem(){
            Row({space:10}){
              Image($r(item.avatar))
                .width(30)
                .height(30)
                .borderRadius(4)
              Column(){
                Text(item.username)
                  .fontSize(14)
                  .fontColor($r("app.color.text_primary"))

              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)
            }
            .padding({
              left: 10,
              right: 10

            })
            .height(60)
            .width("100%")
            .stateStyles({
              pressed:{
                .backgroundColor($r("app.color.back_color"))
              },
              normal:{
                .backgroundColor($r("app.color.white"))
              }
            })
          }
          .onClick(() => {
            router.pushUrl({
              url: "pages/ChatDetail/ChatDetail",
              params:item
            })
          })
        },(item:UserInfo) => item.user_id)


      }
      .width("100%")
      .height("100%")
      .padding({
        top:10,
        bottom:10
      })
      .backgroundColor($r("app.color.white"))
      .divider({
        strokeWidth:1,
        color:$r("app.color.border_color")

      })
      .layoutWeight(1)
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.back_color"))
    .padding({
      top: 20
    })

  }
}

export default connect