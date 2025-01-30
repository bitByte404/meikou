@Entry
@Component
struct FlexibleCapabilitySample1 {
  @State containerWidth: number = 402

  // 底部滑块，可以通过拖拽滑块改变容器尺寸。
  @Builder
  slider() {
    // 拖动滑块改动容器尺寸，看作一个特殊的表单输入框
    Slider({
      value: this.containerWidth,
      min: 402,
      max: 1000,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .onChange((value: number) => {
        this.containerWidth = value;
      })
      .position({ x: '20%', y: '80%' })
  }

  build() {
    Column() {
      Text(this.containerWidth.toString())
        .fontSize(40)
      Column() {
        Row() {
          // 均分
          // 通过flexGrow和flexShrink属性，将多余的空间全部分配给图片，将不足的空间全部分配给两侧空白区域。
          Row()
            .width(150)
            .height(400)
            .backgroundColor($r('sys.color.comp_background_list_card'))
            // .flexGrow(0)  增加
            // .flexShrink(1) 缩
            // .layoutWeight(1) 同时伸缩
            .flexShrink(1)
          Image($r("app.media.avatar"))
            .width(400)
            .height(400)
            .objectFit(ImageFit.Contain)
            .backgroundColor("#66F1CCB8")
            // .layoutWeight(1)
            .flexGrow(1)
            .flexShrink(0)
            // .flexShrink(0)
          Row()
            .width(150)
            .height(400)
            .backgroundColor($r('sys.color.comp_background_list_card'))
            // .layoutWeight(1)
            // .flexGrow(0)
            // .flexShrink(1)
            .flexShrink(1)
        }
        .border({width: 5})
        .width(this.containerWidth)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
      }

      this.slider()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}