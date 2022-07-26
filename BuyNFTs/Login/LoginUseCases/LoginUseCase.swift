//
//  CustomerUseCase.swift
//  Domain
//
//  Created by Gustavo Araujo Santos on 29/07/22.
//

import Foundation
import Shared

enum LoginError: Error {
    case userNotFound
}

extension LoginError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .userNotFound:
            return NSLocalizedString("Credentials not found..", comment: "Login Error")
        }
    }
}

public protocol LoginUseCaseProtocol {
    func execute(userName: String, password: String) async throws -> String
}

public class LoginUseCase: LoginUseCaseProtocol {

    private var userRepository: UserRepositoryProtocol

    public init(useRepository: UserRepositoryProtocol) {
        self.userRepository = useRepository
    }

    public func execute(userName: String, password: String) async throws -> String {
        do {
            let userResult = try await userRepository.getUser(username: userName, password: password)
            return userResult.token
        } catch {
            throw LoginError.userNotFound
        }
    }
}
