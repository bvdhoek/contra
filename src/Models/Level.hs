module Models.Level where
  import Models.Platform

  type Level = [Platform]

  baseLevel :: Level
  baseLevel = [basePlatform]
