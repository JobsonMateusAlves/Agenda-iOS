// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Fechar
    internal static let fechar = L10n.tr("Localizable", "common.fechar")
    /// Ok
    internal static let ok = L10n.tr("Localizable", "common.ok")
  }

  internal enum Contatos {
    /// Meus contatos
    internal static let title = L10n.tr("Localizable", "contatos.title")

    internal enum Criar {
      /// Criar contato
      internal static let title = L10n.tr("Localizable", "contatos.criar.title")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
