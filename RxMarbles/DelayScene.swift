//
//  DelayScene.swift
//  RxMarbles
//
//  Created by Roman Tutubalin on 06.01.16.
//  Copyright © 2016 Roman Tutubalin. All rights reserved.
//

import SpriteKit
import RxSwift

class DelayScene: TemplateScene {
    
    var completedLine: SKShapeNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        drawTimeLine(100.0, name: "timeline")
        for i in 1..<4 {
                let color = RXMUIKit.randomColor()
                let t = ColoredType(value: i, color: color)
                sourceEvents.append(drawCircleElementWithOptions("", color: color, timelineName: "timeline", time: 50 * i, t: t))
            }
        
        completedLine = drawEndOnTimeLineWithName("completed", axisX: frame.size.width - 80.0, timelineName: "timeline")
        
        drawTimeLine(200.0, name: "resultTimeline")
        
        synchronizeTimeLines()
    }
    
    override func synchronizeTimeLines() {
        delay()
    }
    
//    MARK: delay
    
    func delay() {
        let scheduler = TestScheduler(initialClock: 0)
        
        var events = sourceEvents.map({ $0.recorded })
        events.append(Recorded(time: Int(completedLine.position.x), event: Event.Completed))
        
        print(events)
        let t = scheduler.createColdObservable(
            events
        )
        
        let res = scheduler.start(0, subscribed: 0, disposed: Int(frame.width)) {
            return t.delaySubscription(30, scheduler: scheduler)
        }
        print(res.events)
        createResultTimelineElements(res.events)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}