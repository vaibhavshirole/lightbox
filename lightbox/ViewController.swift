//
//  ViewController.swift
//  lightbox
//
//  Created by Vaibhav Shirole on 1/26/24.
//

import PencilKit
import UIKit

class ViewController: UIViewController, PKCanvasViewDelegate {
    
    // create surface to enable drawing
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput  //allow finger to draw (only pencil by default)
        return canvas
    }()
    
    // allow for drawing to be exported as one collection
    let drawing = PKDrawing()

    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.drawing = drawing //set drawing
        canvasView.delegate = self   //enable delegate callbacks for canvasView
        view.addSubview(canvasView)  //add canvas ui element as a subview
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

    // Canvas methods - from adding PKCanvasViewDelegate
    // when anything on the canvas changes
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
    
    }
    
    // when you've stopped using a tool
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        //print("Stopped using tool")
    }
    
    // when canvasView is done rendering
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
    
    }
    
    // when a specific tool started being used
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        //print("Started using tool")
    }
}

