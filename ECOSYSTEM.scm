;; SPDX-License-Identifier: MIT
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm - Related projects and ecosystem context

(ecosystem
  (name "neurophone")
  (type "application")  ;; NOT a library
  (purpose "Android application for neurosymbolic AI with on-device inference")

  (position-in-ecosystem
    "This is the APPLICATION layer - a complete Android app.
     Processes sensors, runs neural networks, does LLM inference.
     Could consume mobile-ai-orchestrator for routing decisions.")

  (target-platform
    (os "Android")
    (min-version "8.0")
    (primary-device "Oppo Reno 13")
    (soc "MediaTek Dimensity 8350"))

  (related-projects
    (project
      (name "mobile-ai-orchestrator")
      (url "https://github.com/hyperpolymath/heterogenous-mobile-computing")
      (relationship "potential-dependency")
      (description "Platform-agnostic AI routing library")
      (differentiation
        "mobile-ai-orchestrator = Library for routing decisions (platform-agnostic)
         this = Complete Android app with sensors, neural networks, JNI"))

    (project
      (name "echomesh")
      (url "https://github.com/hyperpolymath/echomesh")
      (relationship "complementary")
      (description "Conversation context preservation across sessions"))

    (project
      (name "oblibeny")
      (url "https://github.com/hyperpolymath/oblibeny")
      (relationship "inspiration")
      (description "Safety-critical programming language concepts")))

  (what-this-is
    "A complete Android application that:
     - Reads phone sensors (accelerometer, gyroscope, etc.)
     - Processes sensor data through spiking neural networks (LSM)
     - Maintains state via Echo State Networks (ESN)
     - Generates context for LLM queries
     - Runs local Llama 3.2 inference
     - Falls back to Claude API for complex queries

     Provides: Complete pipeline from sensors to AI response
     Runs on: Android devices (primarily Oppo Reno 13)")

  (what-this-is-not
    "- NOT a library (see mobile-ai-orchestrator for that)
     - NOT platform-agnostic (Android-specific with JNI)
     - NOT just routing (does actual inference)
     - NOT cloud-only (local-first with cloud fallback)")

  (architecture
    (crates
      (lsm "Liquid State Machine - spiking neurons")
      (esn "Echo State Network - reservoir computing")
      (bridge "Neural ↔ Symbolic translation")
      (sensors "Phone sensor processing")
      (llm "Local Llama 3.2 inference")
      (claude-client "Cloud API fallback")
      (neurophone-core "Main orchestrator")
      (neurophone-android "JNI bindings for Kotlin")))

  (future-integration
    "May adopt mobile-ai-orchestrator for smarter routing:
     - This app handles: sensors → neural processing → LLM
     - mobile-ai-orchestrator handles: local vs cloud decision
     - Combined: neural-aware intelligent routing"))
