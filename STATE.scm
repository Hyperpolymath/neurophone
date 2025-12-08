;;; STATE.scm — NeuroPhone Project State
;;; Checkpoint/restore system for AI conversations
;;; Format: Guile Scheme (homoiconic, human-readable)

(define state-version "1.0.0")
(define last-updated "2025-12-08")

;;;; ============================================================
;;;; CURRENT POSITION
;;;; ============================================================

(define current-position
  '((status . "working-prototype")
    (version . "0.1.0")
    (completion . 65)
    (phase . "pre-mvp")

    (what-exists
      ((component . "lsm")
       (status . "complete")
       (description . "Liquid State Machine - 512 spiking neurons in 8x8x8 grid")
       (lines . 519))

      ((component . "esn")
       (status . "complete")
       (description . "Echo State Network - 300 neurons, 0.95 spectral radius")
       (lines . 595))

      ((component . "bridge")
       (status . "complete")
       (description . "Neural-to-symbolic integration, projects to 2048-dim LLM space")
       (lines . 610))

      ((component . "sensors")
       (status . "complete")
       (description . "9 sensor types, 50Hz sampling, IIR filtering")
       (lines . 601))

      ((component . "llm")
       (status . "complete")
       (description . "Local Llama 3.2 integration via llama.cpp")
       (lines . 570))

      ((component . "claude-client")
       (status . "complete")
       (description . "Cloud fallback with retry logic and rate limiting")
       (lines . 547))

      ((component . "neurophone-core")
       (status . "complete")
       (description . "Main orchestrator with 50Hz processing loop")
       (lines . 515))

      ((component . "neurophone-android")
       (status . "complete")
       (description . "JNI bindings for Kotlin/Android")
       (lines . 429)))

    (what-works
      "Core neurosymbolic pipeline fully implemented"
      "LSM spiking neural network processing sensor streams"
      "ESN reservoir computing for state prediction"
      "Bridge integrating neural states into LLM embeddings"
      "Local LLM inference path operational"
      "Cloud Claude API fallback operational"
      "Android JNI bindings complete"
      "Sensor processing with filtering and feature extraction"
      "Async Tokio runtime integration"
      "Unit tests passing for all core components")

    (what-untested
      "Real hardware deployment on Oppo Reno 13"
      "End-to-end latency on actual device"
      "Battery consumption under continuous use"
      "Llama model loading on device memory"
      "Neural context quality in real-world scenarios")))

;;;; ============================================================
;;;; ROUTE TO MVP v1
;;;; ============================================================

(define mvp-v1-roadmap
  '((target-version . "1.0.0")
    (target-status . "production-ready-beta")

    (milestones
      ((id . "M1")
       (name . "Hardware Validation")
       (status . "not-started")
       (priority . "critical")
       (tasks
         "Deploy to Oppo Reno 13 and verify boot"
         "Validate sensor pipeline with real hardware sensors"
         "Measure actual LSM/ESN step latency"
         "Confirm Llama 3.2 1B loads within memory constraints"
         "Profile battery drain over 1-hour session"))

      ((id . "M2")
       (name . "Model Integration")
       (status . "not-started")
       (priority . "critical")
       (tasks
         "Download and bundle Llama 3.2 1B Q4_K_M for Android"
         "Test model inference quality with neural context"
         "Tune local/cloud decision threshold based on real performance"
         "Verify Claude API connectivity and response quality"))

      ((id . "M3")
       (name . "User Experience Polish")
       (status . "not-started")
       (priority . "high")
       (tasks
         "Implement loading states and progress indicators"
         "Add error handling UI for common failures"
         "Create onboarding flow explaining neural context"
         "Design status indicators for local vs cloud inference"))

      ((id . "M4")
       (name . "Stability & Edge Cases")
       (status . "not-started")
       (priority . "high")
       (tasks
         "Handle sensor disconnection gracefully"
         "Implement network failure recovery"
         "Add low-memory fallback behavior"
         "Test app lifecycle (background/foreground transitions)"))

      ((id . "M5")
       (name . "Performance Optimization")
       (status . "not-started")
       (priority . "medium")
       (tasks
         "Profile and optimize hot paths in sensor loop"
         "Reduce memory allocations in neural processing"
         "Implement adaptive sampling rate based on activity"
         "Optimize JNI crossing overhead"))

      ((id . "M6")
       (name . "Documentation & Release")
       (status . "not-started")
       (priority . "medium")
       (tasks
         "Write user guide for beta testers"
         "Document known limitations"
         "Create troubleshooting guide"
         "Prepare release APK with signing")))))

;;;; ============================================================
;;;; ISSUES / BLOCKERS
;;;; ============================================================

(define issues
  '((critical
      ((id . "I1")
       (title . "No hardware testing yet")
       (description . "All development done in simulation/emulation. Real device behavior unknown.")
       (impact . "Core assumptions about latency and memory may be invalid")
       (mitigation . "Deploy to Oppo Reno 13 as soon as possible"))

      ((id . "I2")
       (title . "Llama model not bundled")
       (description . "Model file (llama-3.2-1b-q4_k_m.gguf) must be downloaded separately")
       (impact . "First-run experience requires manual setup or large download")
       (mitigation . "Consider asset bundling or first-run download with progress")))

    (high
      ((id . "I3")
       (title . "FFT frequency analysis incomplete")
       (description . "sensors/lib.rs:323 - dominant frequency computation not implemented")
       (impact . "Reduced feature extraction quality for periodic signals")
       (mitigation . "Implement rustfft integration"))

      ((id . "I4")
       (title . "Neural context quality unvalidated")
       (description . "Bridge projections to LLM space are random/learned but not evaluated")
       (impact . "Unknown if neural context actually helps LLM responses")
       (mitigation . "Design evaluation protocol comparing with/without neural context")))

    (medium
      ((id . "I5")
       (title . "No telemetry or analytics")
       (description . "No way to understand real-world usage patterns")
       (impact . "Cannot iterate based on user behavior")
       (mitigation . "Add opt-in anonymous analytics"))

      ((id . "I6")
       (title . "Single device target")
       (description . "Optimized only for Oppo Reno 13 / Dimensity 8350")
       (impact . "Unknown compatibility with other Android devices")
       (mitigation . "Test on variety of Android devices post-MVP")))))

;;;; ============================================================
;;;; QUESTIONS FOR USER
;;;; ============================================================

(define questions-for-user
  '((hardware
      ((q . "Q1")
       (question . "Do you have access to an Oppo Reno 13 for testing?")
       (context . "Hardware validation is critical path to MVP")
       (if-yes . "We can proceed with real device testing")
       (if-no . "We need to acquire device or find alternative test hardware"))

      ((q . "Q2")
       (question . "What's the target deployment method - sideload APK or Play Store?")
       (context . "Affects signing, bundling, and update strategy")
       (options . ("sideload" "play-store" "both"))))

    (product
      ((q . "Q3")
       (question . "Who is the target user for MVP v1?")
       (context . "Affects UX complexity and feature prioritization")
       (options . ("developers/researchers" "tech-enthusiasts" "general-public")))

      ((q . "Q4")
       (question . "What's the primary use case you want to demo?")
       (context . "Should focus polish on one compelling scenario")
       (examples . ("context-aware assistant" "activity recognition" "health monitoring" "smart automation")))

      ((q . "Q5")
       (question . "Is Claude API required or optional for MVP?")
       (context . "Affects complexity - pure local vs hybrid approach")
       (tradeoff . "Local-only simpler but less capable; hybrid more powerful but needs API key")))

    (technical
      ((q . "Q6")
       (question . "What's acceptable cold-start time for the app?")
       (context . "Affects model loading strategy and UX")
       (range . "1s (no model preload) to 30s (full model load)"))

      ((q . "Q7")
       (question . "Should neural processing continue in background?")
       (context . "Affects battery life and Android service architecture")
       (tradeoff . "Background = more context but more battery drain"))

      ((q . "Q8")
       (question . "Is there an existing ANTHROPIC_API_KEY to use, or should we support key input in app?")
       (context . "Current implementation expects env variable")
       (options . ("hardcode-for-testing" "env-variable" "in-app-input" "no-cloud"))))))

;;;; ============================================================
;;;; LONG TERM ROADMAP
;;;; ============================================================

(define long-term-roadmap
  '((v1.0 . "MVP Beta")
    (v1.0-goals
      "Stable operation on Oppo Reno 13"
      "Basic neural-enhanced chat interface"
      "Local + cloud hybrid inference"
      "Proof of neural context value")

    (v1.x . "Polish & Expand")
    (v1.x-goals
      "Multi-device Android support"
      "Improved neural context generation"
      "User-trainable neural patterns"
      "Conversation history with neural snapshots"
      "Export/share neural profiles")

    (v2.0 . "Advanced Neural Features")
    (v2.0-goals
      "Hierarchical ESN for multi-timescale learning"
      "Persistent neural state across sessions"
      "Cross-device neural profile sync"
      "Custom wake-word/trigger detection"
      "Proactive suggestions based on neural patterns")

    (v3.0 . "Platform Expansion")
    (v3.0-goals
      "iOS port via Rust + Swift bindings"
      "Wearable integration (smartwatch sensors)"
      "Edge computing hub for multi-device neural fusion"
      "Developer API for third-party neural apps")

    (moonshots
      "Federated learning across devices (privacy-preserving)"
      "Neural-symbolic reasoning chains"
      "Embodied AI with robotic sensor integration"
      "Brain-computer interface prototype"
      "Open neurosymbolic AI platform/framework")))

;;;; ============================================================
;;;; CRITICAL NEXT ACTIONS
;;;; ============================================================

(define critical-next-actions
  '(((priority . 1)
     (action . "Deploy to physical Oppo Reno 13")
     (why . "Validate all assumptions about real-world performance")
     (blockers . ("device-access" "model-file-bundling")))

    ((priority . 2)
     (action . "Bundle or download Llama 3.2 1B model")
     (why . "Required for local inference to function")
     (blockers . ("storage-strategy-decision")))

    ((priority . 3)
     (action . "Implement FFT for frequency analysis")
     (why . "Complete sensor feature extraction pipeline")
     (blockers . ()))

    ((priority . 4)
     (action . "Design neural context evaluation protocol")
     (why . "Prove that neural context improves LLM responses")
     (blockers . ()))

    ((priority . 5)
     (action . "Add graceful error handling in Android UI")
     (why . "User experience for common failure cases")
     (blockers . ()))))

;;;; ============================================================
;;;; SUMMARY
;;;; ============================================================

(define summary
  '((one-liner . "NeuroPhone: Neurosymbolic AI for mobile - prototype complete, needs hardware validation")

    (status-emoji . "🟡")  ; Yellow - working but untested on real hardware

    (confidence-level . "medium")
    (confidence-rationale . "Code is solid and tests pass, but no real device testing yet")

    (biggest-risk . "Real-world performance may not match simulation")
    (biggest-opportunity . "First neurosymbolic AI system running on consumer mobile")

    (estimated-to-mvp . "2-4 weeks of focused work assuming device access")

    (help-needed
      "Hardware testing on Oppo Reno 13"
      "UX design input for neural context visualization"
      "Evaluation methodology for neural context quality")))

;;; End of STATE.scm
