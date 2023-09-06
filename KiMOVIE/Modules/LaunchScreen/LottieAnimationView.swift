//
//  LottieAnimationView.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 05.09.2023.
//

import UIKit
import Lottie
import SnapKit


class LottieAnimationView: UIViewController {

var launcIsAnimation = true

	private lazy var animationView: AnimationView = crateAnimationview()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white


		animationView.play()
		view.addSubview(animationView)
		animationView.snp.makeConstraints { make in
			make.centerX.equalTo(self.view)
			make.centerY.equalTo(self.view)
			make.width.height.equalTo(200)
		}
	}
}

extension LottieAnimationView {

	// Create UI elements
	func crateAnimationview() -> AnimationView {
		let animationView: AnimationView = .init()

		animationView.animation = Animation.named("LaunchScreenLottie")
		animationView.loopMode = .loop
		animationView.translatesAutoresizingMaskIntoConstraints = false

		return animationView
	}
}
