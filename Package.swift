// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

struct Smell {
    private let name: String
    private let Refactors: [Refactor]
    private init(_ name: String, _ Refactors: [Refactor] = []) {
        self.name = name
        self.Refactors = Refactors
    }
    
    var target: Target {
        return .target(
            name: name,
            dependencies: Refactors.map(\.dependency),
            path: "Sources/Smell/\(name)"
        )
    }
    
    /// 85
    static let AlternativeClasses: Smell = .init(#function, [
        Refactor.Chapter7.MoveMethod,
        Refactor.Chapter10.RenameMethod
    ])
    
    static let allCases: [Smell] = [
       AlternativeClasses,
    ]
}

struct Refactor {
    private let name: String
    private let dir: String
    private init(_ name: String, _ dir: String) {
        self.name = name
        self.dir = dir
    }
    
    var path: String {
        "\(dir)/\(name)"
    }
    /// touch $(1)/Origin.swift
    /// touch $(1)/Refactor.swift
    var target: Target {
        return .target(
            name: name,
            dependencies: [],
            path: path,
            exclude: ["Test.swift"],
            sources: [
                "Origin.swift",
                "Refactor.swift",
            ]
        )
    }

    private var testName: String {
        name + "Tests"
    }
    /// touch $(1)/Test.swift
    var test: Target {
        return .testTarget(
            name: self.testName,
            dependencies: [.target(name: name)],
            path: path,
            sources: [
                "Test.swift",
            ]
        )
    }
    
    var dependency: Target.Dependency {
        return .target(name: name)
    }
}

extension Refactor {
    typealias Chapter6 = Chapter6ComposingMethod
    typealias Chapter7 = Chapter7MovingFeaturesBetweenObjects
    typealias Chapter10 = Chapter10MakingMethodCallsSimpler
    enum Chapter6ComposingMethod {
        private static let path = "Chapter6"
        static var ExtractMethod: Refactor { .init(#function, path) }
        static var InlineMethod: Refactor { .init(#function, path) }
        static var InlineTemp: Refactor { .init(#function, path) }
        static var ReplaceTempWithQuery: Refactor { .init(#function, path) }
        static var IntroduceExplainingVariable: Refactor { .init(#function, path) }
        static var SplitTemporaryVariable: Refactor { .init(#function, path) }
        static var RemoveAssignmentToParameters: Refactor { .init(#function, path) }
        static var REplaceMethodWithMethodObject: Refactor { .init(#function, path) }
        static var SubstituteAlgorithm: Refactor { .init(#function, path) }

        static let allCases: [Refactor] = [
            ExtractMethod,
            InlineMethod,
            InlineTemp,
            ReplaceTempWithQuery,
            IntroduceExplainingVariable,
            SplitTemporaryVariable,
            RemoveAssignmentToParameters,
            REplaceMethodWithMethodObject,
            SubstituteAlgorithm,
        ]
    }
    
    enum Chapter7MovingFeaturesBetweenObjects {
        private static let path = "Chapter7"
        /// P142
        static var MoveMethod: Refactor { .init(#function, path) }
        static var MoveField: Refactor { .init(#function, path) }
        static var ExtractClass: Refactor { .init(#function, path) }
        static var InlineClass: Refactor { .init(#function, path) }

        static var HideDelegate: Refactor { .init(#function, path) }
        static var RemoveMiddleMan: Refactor { .init(#function, path) }
        static var IntroduceForeignMethod: Refactor { .init(#function, path) }
        static var IntroduceLocalExtension: Refactor { .init(#function, path) }

        static let allCases: [Refactor] = [
            MoveMethod,
            // MoveField,
            // ExtractClass,
            // InlineClass,
            // HideDelegate,
            // RemoveMiddleMan,
            // IntroduceForeignMethod,
            // IntroduceLocalExtension,
        ]
    }

    enum Chapter10MakingMethodCallsSimpler {
        private static let path = "Chapter10"
        /// 10.1 P273
        static var RenameMethod: Refactor { .init(#function, path) }
        // static var MoveField: Refactor { .init(#function, path) }
        // static var ExtractClass: Refactor { .init(#function, path) }
        // static var InlineClass: Refactor { .init(#function, path) }

        // static var HideDelegate: Refactor { .init(#function, path) }
        // static var RemoveMiddleMan: Refactor { .init(#function, path) }
        // static var IntroduceForeignMethod: Refactor { .init(#function, path) }
        // static var IntroduceLocalExtension: Refactor { .init(#function, path) }
        static let allCases: [Refactor] = [
            RenameMethod
        ]
    }

    static let allCases: [Refactor] =
        Chapter6.allCases + 
        Chapter7.allCases + 
        Chapter10.allCases

}

let package = Package(
    name: "Refactor",
    targets: 
        // Smell.allCases.map(\.target) + 
        Refactor.allCases.map(\.target)
)
