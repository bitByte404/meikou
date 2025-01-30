@Entry
@Component
struct EquipartitionCapabilitySample {
  readonly list: number [] = [0, 1, 2, 3]
  @State rate: number = 0.6

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder slider() {
    Slider({ value: this.rate * 100, min: 30, max: 60, style: SliderStyle.OutSet })
      .blockColor(Color.White)
      .width('60%')
      .onChange((value: number) => {
        this.rate = value / 100
      })
      .position({ x: '20%', y: '80%' })
  }

  build() {
    Column() {
      Column() {
        // 均匀分配父容器主轴方向的剩余空间
        Row() {
          ForEach(this.list, (item:number) => {
            Column() {
              Image($r("app.media.startIcon")).width(48).height(48).margin({ top: 8 })
              Text('App name')
                .width(64)
                .height(30)
                .lineHeight(15)
                .fontSize(12)
                .textAlign(TextAlign.Center)
                .margin({ top: 8 })
                .padding({ bottom: 15 })
            }
            .width(80)
            .height(102)
            .flexShrink(1)
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        // 均匀分配父容器主轴方向的剩余空间
        Row() {
          ForEach(this.list, (item:number) => {
            Column() {
              Image($r("app.media.startIcon")).width(48).height(48).margin({ top: 8 })
              Text('App name')
                .width(64)
                .height(30)
                .lineHeight(15)
                .fontSize(12)
                .textAlign(TextAlign.Center)
                .margin({ top: 8 })
                .padding({ bottom: 15 })
            }
            .width(80)
            .height(102)
            .flexShrink(1)
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .width(this.rate * 100 + '%')
      .height(222)
      .padding({ top: 16 })
      .backgroundColor('#FFFFFF')
      .borderRadius(16)

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}