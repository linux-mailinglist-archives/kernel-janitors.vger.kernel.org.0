Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B843DF444
	for <lists+kernel-janitors@lfdr.de>; Mon, 21 Oct 2019 19:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbfJURaG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 21 Oct 2019 13:30:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729939AbfJURaF (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Oct 2019 13:30:05 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 969E020B7C;
        Mon, 21 Oct 2019 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571679003;
        bh=hIPFF5VMuG2Mz/13SIGk14a7hhEIb6Ib26/KDy0UBVI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LqOwv1JHqMBH7JQL6bqzY78I/+DK63O8QPeKxUGWnY44vG6jBNXFY6vMXqwvVWfUW
         xTIZaUBN+Ds9qOUgBNvkepDHKnT026DVAfIu840JwMbM0FdfHTO6omWqWRXeOICApF
         fTfRLqt2QRf/0ouXTVLl49fU+mGmenjejck70yXM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESENT trivial 2/3] treewide: Fix Kconfig indentation
Date:   Mon, 21 Oct 2019 19:29:52 +0200
Message-Id: <20191021172953.27279-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021172953.27279-1-krzk@kernel.org>
References: <20191021172953.27279-1-krzk@kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
    $ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 certs/Kconfig                  | 14 ++++++-------
 init/Kconfig                   | 28 +++++++++++++-------------
 kernel/trace/Kconfig           |  8 ++++----
 lib/Kconfig                    |  2 +-
 lib/Kconfig.debug              | 36 +++++++++++++++++-----------------
 lib/Kconfig.kgdb               |  8 ++++----
 mm/Kconfig                     | 28 +++++++++++++-------------
 samples/Kconfig                |  2 +-
 security/apparmor/Kconfig      |  2 +-
 security/integrity/Kconfig     | 24 +++++++++++------------
 security/integrity/ima/Kconfig | 12 ++++++------
 security/safesetid/Kconfig     | 24 +++++++++++------------
 12 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/certs/Kconfig b/certs/Kconfig
index c94e93d8bccf..0358c66d3d7c 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -6,14 +6,14 @@ config MODULE_SIG_KEY
 	default "certs/signing_key.pem"
 	depends on MODULE_SIG
 	help
-         Provide the file name of a private key/certificate in PEM format,
-         or a PKCS#11 URI according to RFC7512. The file should contain, or
-         the URI should identify, both the certificate and its corresponding
-         private key.
+	 Provide the file name of a private key/certificate in PEM format,
+	 or a PKCS#11 URI according to RFC7512. The file should contain, or
+	 the URI should identify, both the certificate and its corresponding
+	 private key.
 
-         If this option is unchanged from its default "certs/signing_key.pem",
-         then the kernel will automatically generate the private key and
-         certificate as described in Documentation/admin-guide/module-signing.rst
+	 If this option is unchanged from its default "certs/signing_key.pem",
+	 then the kernel will automatically generate the private key and
+	 certificate as described in Documentation/admin-guide/module-signing.rst
 
 config SYSTEM_TRUSTED_KEYRING
 	bool "Provide system-wide ring of trusted keys"
diff --git a/init/Kconfig b/init/Kconfig
index b4daad2bac23..e1a6f31da281 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -169,10 +169,10 @@ config BUILD_SALT
        string "Build ID Salt"
        default ""
        help
-          The build ID is used to link binaries and their debug info. Setting
-          this option will use the value in the calculation of the build id.
-          This is mostly useful for distributions which want to ensure the
-          build is unique between builds. It's safe to leave the default.
+	  The build ID is used to link binaries and their debug info. Setting
+	  this option will use the value in the calculation of the build id.
+	  This is mostly useful for distributions which want to ensure the
+	  build is unique between builds. It's safe to leave the default.
 
 config HAVE_KERNEL_GZIP
 	bool
@@ -1327,9 +1327,9 @@ menuconfig EXPERT
 	select DEBUG_KERNEL
 	help
 	  This option allows certain base kernel options and settings
-          to be disabled or tweaked. This is for specialized
-          environments which can tolerate a "non-standard" kernel.
-          Only use this if you really know what you are doing.
+	  to be disabled or tweaked. This is for specialized
+	  environments which can tolerate a "non-standard" kernel.
+	  Only use this if you really know what you are doing.
 
 config UID16
 	bool "Enable 16-bit UID system calls" if EXPERT
@@ -1439,11 +1439,11 @@ config BUG
 	bool "BUG() support" if EXPERT
 	default y
 	help
-          Disabling this option eliminates support for BUG and WARN, reducing
-          the size of your kernel image and potentially quietly ignoring
-          numerous fatal conditions. You should only consider disabling this
-          option for embedded systems with no facilities for reporting errors.
-          Just say Y.
+	  Disabling this option eliminates support for BUG and WARN, reducing
+	  the size of your kernel image and potentially quietly ignoring
+	  numerous fatal conditions. You should only consider disabling this
+	  option for embedded systems with no facilities for reporting errors.
+	  Just say Y.
 
 config ELF_CORE
 	depends on COREDUMP
@@ -1459,8 +1459,8 @@ config PCSPKR_PLATFORM
 	select I8253_LOCK
 	default y
 	help
-          This option allows to disable the internal PC-Speaker
-          support, saving some memory.
+	  This option allows to disable the internal PC-Speaker
+	  support, saving some memory.
 
 config BASE_FULL
 	default y
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index e08527f50d2a..0393003f102f 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -76,7 +76,7 @@ config FTRACE_NMI_ENTER
 
 config EVENT_TRACING
 	select CONTEXT_SWITCH_TRACER
-        select GLOB
+	select GLOB
 	bool
 
 config CONTEXT_SWITCH_TRACER
@@ -308,7 +308,7 @@ config TRACER_SNAPSHOT
 	      cat snapshot
 
 config TRACER_SNAPSHOT_PER_CPU_SWAP
-        bool "Allow snapshot to swap per CPU"
+	bool "Allow snapshot to swap per CPU"
 	depends on TRACER_SNAPSHOT
 	select RING_BUFFER_ALLOW_SWAP
 	help
@@ -675,7 +675,7 @@ config MMIOTRACE_TEST
 	  Say N, unless you absolutely know what you are doing.
 
 config TRACEPOINT_BENCHMARK
-        bool "Add tracepoint that benchmarks tracepoints"
+	bool "Add tracepoint that benchmarks tracepoints"
 	help
 	 This option creates the tracepoint "benchmark:benchmark_event".
 	 When the tracepoint is enabled, it kicks off a kernel thread that
@@ -724,7 +724,7 @@ config RING_BUFFER_STARTUP_TEST
        bool "Ring buffer startup self test"
        depends on RING_BUFFER
        help
-         Run a simple self test on the ring buffer on boot up. Late in the
+	 Run a simple self test on the ring buffer on boot up. Late in the
 	 kernel boot sequence, the test will start that kicks off
 	 a thread per cpu. Each thread will write various size events
 	 into the ring buffer. Another thread is created to send IPIs
diff --git a/lib/Kconfig b/lib/Kconfig
index 183f92a297ca..b7eb98342e39 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -573,7 +573,7 @@ config OID_REGISTRY
 	  Enable fast lookup object identifier registry.
 
 config UCS2_STRING
-        tristate
+	tristate
 
 #
 # generic vdso
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a0250e53954a..f9833ea51389 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -128,8 +128,8 @@ config DYNAMIC_DEBUG
 	  lineno : line number of the debug statement
 	  module : module that contains the debug statement
 	  function : function that contains the debug statement
-          flags : '=p' means the line is turned 'on' for printing
-          format : the format used for the debug statement
+	  flags : '=p' means the line is turned 'on' for printing
+	  format : the format used for the debug statement
 
 	  From a live system:
 
@@ -172,7 +172,7 @@ config DEBUG_INFO
 	bool "Compile the kernel with debug info"
 	depends on DEBUG_KERNEL && !COMPILE_TEST
 	help
-          If you say Y here the resulting kernel image will include
+	  If you say Y here the resulting kernel image will include
 	  debugging info resulting in a larger kernel image.
 	  This adds debug symbols to the kernel and modules (gcc -g), and
 	  is needed if you intend to use kernel crashdump or binary object
@@ -269,13 +269,13 @@ config STRIP_ASM_SYMS
 	  get_wchan() and suchlike.
 
 config READABLE_ASM
-        bool "Generate readable assembler code"
-        depends on DEBUG_KERNEL
-        help
-          Disable some compiler optimizations that tend to generate human unreadable
-          assembler output. This may make the kernel slightly slower, but it helps
-          to keep kernel developers who have to stare a lot at assembler listings
-          sane.
+	bool "Generate readable assembler code"
+	depends on DEBUG_KERNEL
+	help
+	  Disable some compiler optimizations that tend to generate human unreadable
+	  assembler output. This may make the kernel slightly slower, but it helps
+	  to keep kernel developers who have to stare a lot at assembler listings
+	  sane.
 
 config DEBUG_FS
 	bool "Debug Filesystem"
@@ -508,11 +508,11 @@ config DEBUG_OBJECTS_PERCPU_COUNTER
 
 config DEBUG_OBJECTS_ENABLE_DEFAULT
 	int "debug_objects bootup default value (0-1)"
-        range 0 1
-        default "1"
-        depends on DEBUG_OBJECTS
-        help
-          Debug objects boot parameter default value
+	range 0 1
+	default "1"
+	depends on DEBUG_OBJECTS
+	help
+	  Debug objects boot parameter default value
 
 config DEBUG_SLAB
 	bool "Debug slab memory allocations"
@@ -631,7 +631,7 @@ config DEBUG_VM
 	depends on DEBUG_KERNEL
 	help
 	  Enable this to turn on extended checks in the virtual-memory system
-          that may impact performance.
+	  that may impact performance.
 
 	  If unsure, say N.
 
@@ -1421,7 +1421,7 @@ config DEBUG_WQ_FORCE_RR_CPU
 	  be impacted.
 
 config DEBUG_BLOCK_EXT_DEVT
-        bool "Force extended block device numbers and spread them"
+	bool "Force extended block device numbers and spread them"
 	depends on DEBUG_KERNEL
 	depends on BLOCK
 	default n
@@ -2142,7 +2142,7 @@ config DEBUG_AID_FOR_SYZBOT
        bool "Additional debug code for syzbot"
        default n
        help
-         This option is intended for testing by syzbot.
+	 This option is intended for testing by syzbot.
 
 source "arch/$(SRCARCH)/Kconfig.debug"
 
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index bbe397df04a3..933680b59e2d 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -64,9 +64,9 @@ config KGDB_LOW_LEVEL_TRAP
        depends on X86 || MIPS
        default n
        help
-         This will add an extra call back to kgdb for the breakpoint
-         exception handler which will allow kgdb to step through a
-         notify handler.
+	 This will add an extra call back to kgdb for the breakpoint
+	 exception handler which will allow kgdb to step through a
+	 notify handler.
 
 config KGDB_KDB
 	bool "KGDB_KDB: include kdb frontend for kgdb"
@@ -96,7 +96,7 @@ config KDB_DEFAULT_ENABLE
 
 	  The config option merely sets the default at boot time. Both
 	  issuing 'echo X > /sys/module/kdb/parameters/cmd_enable' or
-          setting with kdb.cmd_enable=X kernel command line option will
+	  setting with kdb.cmd_enable=X kernel command line option will
 	  override the default settings.
 
 config KDB_KEYBOARD
diff --git a/mm/Kconfig b/mm/Kconfig
index a5dae9a7eb51..e6e16d0ef544 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -160,9 +160,9 @@ config MEMORY_HOTPLUG_SPARSE
 	depends on SPARSEMEM && MEMORY_HOTPLUG
 
 config MEMORY_HOTPLUG_DEFAULT_ONLINE
-        bool "Online the newly added memory blocks by default"
-        depends on MEMORY_HOTPLUG
-        help
+	bool "Online the newly added memory blocks by default"
+	depends on MEMORY_HOTPLUG
+	help
 	  This option sets the default policy setting for memory hotplug
 	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
 	  determines what happens to newly added memory regions. Policy setting
@@ -227,14 +227,14 @@ config COMPACTION
 	select MIGRATION
 	depends on MMU
 	help
-          Compaction is the only memory management component to form
-          high order (larger physically contiguous) memory blocks
-          reliably. The page allocator relies on compaction heavily and
-          the lack of the feature can lead to unexpected OOM killer
-          invocations for high order memory requests. You shouldn't
-          disable this option unless there really is a strong reason for
-          it and then we would be really interested to hear about that at
-          linux-mm@kvack.org.
+	  Compaction is the only memory management component to form
+	  high order (larger physically contiguous) memory blocks
+	  reliably. The page allocator relies on compaction heavily and
+	  the lack of the feature can lead to unexpected OOM killer
+	  invocations for high order memory requests. You shouldn't
+	  disable this option unless there really is a strong reason for
+	  it and then we would be really interested to hear about that at
+	  linux-mm@kvack.org.
 
 #
 # support for page migration
@@ -301,10 +301,10 @@ config KSM
 	  root has set /sys/kernel/mm/ksm/run to 1 (if CONFIG_SYSFS is set).
 
 config DEFAULT_MMAP_MIN_ADDR
-        int "Low address space to protect from user allocation"
+	int "Low address space to protect from user allocation"
 	depends on MMU
-        default 4096
-        help
+	default 4096
+	help
 	  This is the portion of low virtual memory which should be protected
 	  from userspace allocation.  Keeping a user from writing to low pages
 	  can help reduce the impact of kernel NULL pointer bugs.
diff --git a/samples/Kconfig b/samples/Kconfig
index 2c3e07addd38..c5937c5175d2 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -13,7 +13,7 @@ config SAMPLE_TRACE_EVENTS
 	  This build trace event example modules.
 
 config SAMPLE_TRACE_PRINTK
-        tristate "Build trace_printk module - tests various trace_printk formats"
+	tristate "Build trace_printk module - tests various trace_printk formats"
 	depends on EVENT_TRACING && m
 	help
 	 This builds a module that calls trace_printk() and can be used to
diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index a422a349f926..1f0e712c5e50 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -32,7 +32,7 @@ config SECURITY_APPARMOR_HASH_DEFAULT
        depends on SECURITY_APPARMOR_HASH
        default y
        help
-         This option selects whether sha1 hashing of loaded policy
+	 This option selects whether sha1 hashing of loaded policy
 	 is enabled by default. The generation of sha1 hashes for
 	 loaded policy provide system administrators a quick way
 	 to verify that policy in the kernel matches what is expected,
diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 0bae6adb63a9..f7f2df082f51 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -34,10 +34,10 @@ config INTEGRITY_ASYMMETRIC_KEYS
 	bool "Enable asymmetric keys support"
 	depends on INTEGRITY_SIGNATURE
 	default n
-        select ASYMMETRIC_KEY_TYPE
-        select ASYMMETRIC_PUBLIC_KEY_SUBTYPE
-        select CRYPTO_RSA
-        select X509_CERTIFICATE_PARSER
+	select ASYMMETRIC_KEY_TYPE
+	select ASYMMETRIC_PUBLIC_KEY_SUBTYPE
+	select CRYPTO_RSA
+	select X509_CERTIFICATE_PARSER
 	help
 	  This option enables digital signature verification using
 	  asymmetric keys.
@@ -53,14 +53,14 @@ config INTEGRITY_TRUSTED_KEYRING
 	   keyring.
 
 config INTEGRITY_PLATFORM_KEYRING
-        bool "Provide keyring for platform/firmware trusted keys"
-        depends on INTEGRITY_ASYMMETRIC_KEYS
-        depends on SYSTEM_BLACKLIST_KEYRING
-        help
-         Provide a separate, distinct keyring for platform trusted keys, which
-         the kernel automatically populates during initialization from values
-         provided by the platform for verifying the kexec'ed kerned image
-         and, possibly, the initramfs signature.
+	bool "Provide keyring for platform/firmware trusted keys"
+	depends on INTEGRITY_ASYMMETRIC_KEYS
+	depends on SYSTEM_BLACKLIST_KEYRING
+	help
+	 Provide a separate, distinct keyring for platform trusted keys, which
+	 the kernel automatically populates during initialization from values
+	 provided by the platform for verifying the kexec'ed kerned image
+	 and, possibly, the initramfs signature.
 
 config LOAD_UEFI_KEYS
        depends on INTEGRITY_PLATFORM_KEYRING
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 838476d780e5..ec9259bd8115 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -159,13 +159,13 @@ config IMA_APPRAISE
 	  If unsure, say N.
 
 config IMA_ARCH_POLICY
-        bool "Enable loading an IMA architecture specific policy"
-        depends on (KEXEC_SIG && IMA) || IMA_APPRAISE \
+	bool "Enable loading an IMA architecture specific policy"
+	depends on (KEXEC_SIG && IMA) || IMA_APPRAISE \
 		   && INTEGRITY_ASYMMETRIC_KEYS
-        default n
-        help
-          This option enables loading an IMA architecture specific policy
-          based on run time secure boot flags.
+	default n
+	help
+	  This option enables loading an IMA architecture specific policy
+	  based on run time secure boot flags.
 
 config IMA_APPRAISE_BUILD_POLICY
 	bool "IMA build time configured policy rules"
diff --git a/security/safesetid/Kconfig b/security/safesetid/Kconfig
index 18b5fb90417b..ab1a2c69b0b8 100644
--- a/security/safesetid/Kconfig
+++ b/security/safesetid/Kconfig
@@ -1,15 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SECURITY_SAFESETID
-        bool "Gate setid transitions to limit CAP_SET{U/G}ID capabilities"
-        depends on SECURITY
-        select SECURITYFS
-        default n
-        help
-          SafeSetID is an LSM module that gates the setid family of syscalls to
-          restrict UID/GID transitions from a given UID/GID to only those
-          approved by a system-wide whitelist. These restrictions also prohibit
-          the given UIDs/GIDs from obtaining auxiliary privileges associated
-          with CAP_SET{U/G}ID, such as allowing a user to set up user namespace
-          UID mappings.
+	bool "Gate setid transitions to limit CAP_SET{U/G}ID capabilities"
+	depends on SECURITY
+	select SECURITYFS
+	default n
+	help
+	  SafeSetID is an LSM module that gates the setid family of syscalls to
+	  restrict UID/GID transitions from a given UID/GID to only those
+	  approved by a system-wide whitelist. These restrictions also prohibit
+	  the given UIDs/GIDs from obtaining auxiliary privileges associated
+	  with CAP_SET{U/G}ID, such as allowing a user to set up user namespace
+	  UID mappings.
 
-          If you are unsure how to answer this question, answer N.
+	  If you are unsure how to answer this question, answer N.
-- 
2.17.1

