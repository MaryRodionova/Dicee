import UIKit

final class ViewController: UIViewController {
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .greenBackground)
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .diceeLogo)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .horizontal
        verticalStackView.spacing = 50
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()

    private let imageOneCube: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .diceOne)
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let imageTwoCube: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .diceTwo)
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Roll", for: .normal)
        button.backgroundColor = UIColor(red: 167, green: 26, blue: 27)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
    }

    @objc
    private func buttonAction() {
        let images = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        imageOneCube.image = UIImage(named: images.randomElement() ?? "DiceOne")
        imageTwoCube.image = UIImage(named: images.randomElement() ?? "DiceOne")
    }
}

private extension ViewController {
    func addSubviews() {
        view.addSubview(image)
        image.addSubview(imageLogo)
        image.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(imageOneCube)
        verticalStackView.addArrangedSubview(imageTwoCube)
        image.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                image.topAnchor.constraint(equalTo: view.topAnchor),
                image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                image.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                imageLogo.topAnchor.constraint(equalTo: image.topAnchor, constant: 100),
                imageLogo.centerXAnchor.constraint(equalTo: image.centerXAnchor),

                verticalStackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 100),
                verticalStackView.centerXAnchor.constraint(equalTo: image.centerXAnchor),
                verticalStackView.widthAnchor.constraint(equalToConstant: 290),

                button.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 100),
                button.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 100),
                button.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -100)
            ]
        )
    }
}
