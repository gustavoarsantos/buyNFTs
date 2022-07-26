//
//  SharedCompositionRoot.swift
//  Shared
//
//  Created by Gustavo Araujo Santos on 19/11/22.
//

public final class SharedCompositionRoot {

    public static let shared = SharedCompositionRoot()

    private init() { }

    public func buildExistsTokenInKeyChainUseCase() -> ExistsTokenInKeyChainUseCaseProtocol {
        let useCase = ExistsTokenInKeyChainUseCase()
        return useCase
    }

    public func buildSaveTokenInKeyChainUseCase() -> SaveTokenInKeyChainUseCaseProtocol {
        let useCase = SaveTokenInKeyChainUseCase()
        return useCase
    }

    public func buildReadTokenInKeyChainUseCase() -> ReadTokenInKeyChainUseCaseProtocol {
        let useCase = ReadTokenInKeyChainUseCase()
        return useCase
    }

    public func buildNetworkService() -> NetworkServiceProtocol {
        let service = NetworkService()
        return service
    }

    public func buildUserService() -> UserServiceProtocol {
        let service = UserService(networkService: buildNetworkService())
        return service
    }

    public func buildUserRepository() -> UserRepositoryProtocol {
        let repository = UserRepository(userService: buildUserService())
        return repository
    }

}
