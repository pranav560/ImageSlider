/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SliderModel } from './sliderModel'

@Component
export struct ImageSlider {
  @State obj: SliderModel = new SliderModel();
  @State outSetValue: number = 0;
  img: ResourceStr[]= [];

  build() {
    Column({ space: 30 }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Column() {
          Row() {
            Button("prev", { type: ButtonType.Capsule, stateEffect: true })
              .fontColor("#fffff3")
              .height(35)
              .width(70)
              .backgroundColor("#000000")
              .fontSize(15)
              .onClick(() => {
                animateTo({ duration: 1000 }, () => {
                  if (this.outSetValue - 1 == -1) this.outSetValue = (this.obj.getNumberOfItems() - 1)
                  else this.outSetValue = this.outSetValue - 1
                })

              })
          }
        }
        Slider({
          value: this.outSetValue,
          min: 0,
          max: this.obj.getNumberOfItems() - 1,
          step: 1,
          style: SliderStyle.InSet
        })
          .blockColor(this.obj.getBlockColor())
          .trackColor(this.obj.getTrackColor())
          .selectedColor(this.obj.getSelectedColor())
          .showSteps(this.obj.getShowSteps())
          .showTips(false)
          .trackThickness(10)
          .width("70%")
          .onChange((value: number, mode: SliderChangeMode) => {
            animateTo({ duration: 1000 }, () => {
              this.outSetValue = value
            })
            console.info('value:' + value + 'mode:' + mode.toString())
          })
        Column() {
          Row() {
            Button("next", { type: ButtonType.Capsule, stateEffect: true })
              .fontColor("#fffff3")
              .height(35)
              .width(70)
              .backgroundColor("#000000")
              .fontSize(15)
              .onClick(() => {
                animateTo({ duration: 1000 }, () => {
                  this.outSetValue = (this.outSetValue + 1) % (this.obj.getNumberOfItems())
                })
              })
          }
        }
      }
      Column() {
        Image(this.img[this.outSetValue])
          .width("95%")
          .height(350)
      }
    }
    .width('100%')
    .margin({ bottom: 15, top: 20 })
  }
}

export { SliderModel } from "./sliderModel"