Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF4C6FD798
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 May 2023 08:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbjEJG5h (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 May 2023 02:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236238AbjEJG5e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 May 2023 02:57:34 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F33C2D70;
        Tue,  9 May 2023 23:57:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-956ff2399c9so1297272666b.3;
        Tue, 09 May 2023 23:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683701846; x=1686293846;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+dbEsMys/Ym3JGqCxdHcnasjTWVsLiKRgWxcpLtxd78=;
        b=mqdai3Z/jx2DuK16ue8/Q/V0Wm1YT9xpyEUus+xnRfFmSnKpj6hIcvyAIVIl/fxjFH
         lPj8kjmvdglN1mqJKN7EKZs0IzElhiXY0utae9VVLPkrL3NlKAIAz6TuoL02wy8h0Lug
         KcyWVNRr/TodtVR2n1db4uG2bLAFHRCr/vkl3TobKdH+f0l/LHxjGPyqeacHfX8tmUkQ
         Q4FtbwH4/vg5pxarK8bRHy1G9B2TSI4tIV2Pg+Anoi8xfbZFKwVPkrngLUV4hzQL4FjM
         esNk4eGIqXitjjjJ/g0b8NzIdjAXnUHouSt+QuRzPt6Ab8HIfYKszqbvT8XfDImW7kt+
         cWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701846; x=1686293846;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dbEsMys/Ym3JGqCxdHcnasjTWVsLiKRgWxcpLtxd78=;
        b=URIGAwEac5Wl6eHHnKZx8WX2dUuWMlHEzrLFQv4al1d5qqIoMM01oA3EuktyPSvS1e
         2Y8QYW+ENfDc9Z9ABHt6DcmS2MDFRFpRfP1+EJ5bVpWC/0f1d4q2tNHeh1cgWk0UDgEW
         vELbxrAyTJbTG1E+DJBenovDLhN3tCZdgZZ8bI+f2JagXTAErk8JDkmqNtwZXgjmRqWn
         ghPKfc025u5Ez+nvEtuCW6HnhwyVUwltlzlzmWmWOzqM0Mm95RTXZf7rcR9lBJikO8JR
         4ItxCFfNjMNpr0TCtI1lcc4CPTtfMNIMxL6wNnREBhzFsomJSQqTcJbrwLyShzfecEN4
         kCwg==
X-Gm-Message-State: AC+VfDwqkj2d2F6M+sTs9unTgrAT5BTeGO0pV6xLdLJgV2fO6IyL/KiF
        VkooGcPUa9ush9qCsAI8/RM=
X-Google-Smtp-Source: ACHHUZ6p4DSenLrQiL1g1NB3WrVbSdQvwtUtTyJTaKCzutWjmpymmvxceTEDOye13HtC/Sjy2zlGWw==
X-Received: by 2002:a17:907:720e:b0:966:5a6c:752d with SMTP id dr14-20020a170907720e00b009665a6c752dmr8564065ejc.20.1683701845791;
        Tue, 09 May 2023 23:57:25 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:81b:847c:e4fd:f042])
        by smtp.gmail.com with ESMTPSA id ka11-20020a170907990b00b0096602a5ab25sm2274018ejc.92.2023.05.09.23.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:57:25 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/2] x86: always build with X86_FEATURE_NAMES functionality
Date:   Wed, 10 May 2023 08:57:13 +0200
Message-Id: <20230510065713.10996-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230510065713.10996-1-lukas.bulwahn@gmail.com>
References: <20230510065713.10996-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

While discussing to change the visibility of X86_FEATURE_NAMES (see Link)
in order to remove CONFIG_EMBEDDED, Boris suggested to simply make the
X86_FEATURE_NAMES functionality unconditional.

As the need for really tiny kernel images has gone away and kernel images
with !X86_FEATURE_NAMES is hardly tested, remove this config and the whole
ifdeffery in the source code.

Link: https://lore.kernel.org/all/20230509084007.24373-1-lukas.bulwahn@gmail.com/

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/Kconfig                  | 12 ------------
 arch/x86/Kconfig.cpu              |  2 +-
 arch/x86/boot/Makefile            |  2 --
 arch/x86/boot/cpu.c               | 13 -------------
 arch/x86/include/asm/cpufeature.h |  5 -----
 arch/x86/kernel/cpu/Makefile      |  4 +---
 arch/x86/kernel/cpu/common.c      |  4 ----
 7 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a7db116e429a..f6aa7e0ca47d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -291,7 +291,6 @@ config X86
 	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select USER_STACKTRACE_SUPPORT
 	select HAVE_ARCH_KCSAN			if X86_64
-	select X86_FEATURE_NAMES		if PROC_FS
 	select PROC_PID_ARCH_STATUS		if PROC_FS
 	select HAVE_ARCH_NODE_DEV_GROUP		if X86_SGX
 	select FUNCTION_ALIGNMENT_16B		if X86_64 || X86_ALIGNMENT_16
@@ -441,17 +440,6 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
-config X86_FEATURE_NAMES
-	bool
-	default y
-	help
-	  This option compiles in a table of x86 feature bits and corresponding
-	  names.  This is required to support /proc/cpuinfo and a few kernel
-	  messages.  You can disable this to save space, at the expense of
-	  making those few kernel messages show numeric feature bits instead.
-
-	  If in doubt, say Y.
-
 config X86_X2APIC
 	bool "Support x2apic"
 	depends on X86_LOCAL_APIC && X86_64 && (IRQ_REMAP || HYPERVISOR_GUEST)
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 542377cd419d..00468adf180f 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -389,7 +389,7 @@ config IA32_FEAT_CTL
 
 config X86_VMX_FEATURE_NAMES
 	def_bool y
-	depends on IA32_FEAT_CTL && X86_FEATURE_NAMES
+	depends on IA32_FEAT_CTL
 
 menuconfig PROCESSOR_SELECT
 	bool "Supported processor vendors" if EXPERT
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9e38ffaadb5d..f33e45ed1437 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -55,14 +55,12 @@ HOST_EXTRACFLAGS += -I$(srctree)/tools/include \
 		    -include include/generated/autoconf.h \
 	            -D__EXPORTED_HEADERS__
 
-ifdef CONFIG_X86_FEATURE_NAMES
 $(obj)/cpu.o: $(obj)/cpustr.h
 
 quiet_cmd_cpustr = CPUSTR  $@
       cmd_cpustr = $(obj)/mkcpustr > $@
 $(obj)/cpustr.h: $(obj)/mkcpustr FORCE
 	$(call if_changed,cpustr)
-endif
 targets += cpustr.h
 
 # ---------------------------------------------------------------------------
diff --git a/arch/x86/boot/cpu.c b/arch/x86/boot/cpu.c
index 0bbf4f3707d2..feb6dbd7ca86 100644
--- a/arch/x86/boot/cpu.c
+++ b/arch/x86/boot/cpu.c
@@ -14,9 +14,7 @@
  */
 
 #include "boot.h"
-#ifdef CONFIG_X86_FEATURE_NAMES
 #include "cpustr.h"
-#endif
 
 static char *cpu_name(int level)
 {
@@ -35,7 +33,6 @@ static char *cpu_name(int level)
 static void show_cap_strs(u32 *err_flags)
 {
 	int i, j;
-#ifdef CONFIG_X86_FEATURE_NAMES
 	const unsigned char *msg_strs = (const unsigned char *)x86_cap_strs;
 	for (i = 0; i < NCAPINTS; i++) {
 		u32 e = err_flags[i];
@@ -58,16 +55,6 @@ static void show_cap_strs(u32 *err_flags)
 			e >>= 1;
 		}
 	}
-#else
-	for (i = 0; i < NCAPINTS; i++) {
-		u32 e = err_flags[i];
-		for (j = 0; j < 32; j++) {
-			if (e & 1)
-				printf("%d:%d ", i, j);
-			e >>= 1;
-		}
-	}
-#endif
 }
 
 int validate_cpu(void)
diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index ce0c8f7d3218..a26bebbdff87 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -38,15 +38,10 @@ enum cpuid_leafs
 #define X86_CAP_FMT_NUM "%d:%d"
 #define x86_cap_flag_num(flag) ((flag) >> 5), ((flag) & 31)
 
-#ifdef CONFIG_X86_FEATURE_NAMES
 extern const char * const x86_cap_flags[NCAPINTS*32];
 extern const char * const x86_power_flags[32];
 #define X86_CAP_FMT "%s"
 #define x86_cap_flag(flag) x86_cap_flags[flag]
-#else
-#define X86_CAP_FMT X86_CAP_FMT_NUM
-#define x86_cap_flag x86_cap_flag_num
-#endif
 
 /*
  * In order to save room, we index into this array by doing
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index d7e3ceaf75c1..4350f6bfc064 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -27,7 +27,7 @@ obj-y			+= cpuid-deps.o
 obj-y			+= umwait.o
 
 obj-$(CONFIG_PROC_FS)	+= proc.o
-obj-$(CONFIG_X86_FEATURE_NAMES) += capflags.o powerflags.o
+obj-y += capflags.o powerflags.o
 
 obj-$(CONFIG_IA32_FEAT_CTL) += feat_ctl.o
 ifdef CONFIG_CPU_SUP_INTEL
@@ -54,7 +54,6 @@ obj-$(CONFIG_X86_LOCAL_APIC)		+= perfctr-watchdog.o
 obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
 obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
 
-ifdef CONFIG_X86_FEATURE_NAMES
 quiet_cmd_mkcapflags = MKCAP   $@
       cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)/$(src)/mkcapflags.sh $@ $^
 
@@ -63,5 +62,4 @@ vmxfeature = $(src)/../../include/asm/vmxfeatures.h
 
 $(obj)/capflags.c: $(cpufeature) $(vmxfeature) $(src)/mkcapflags.sh FORCE
 	$(call if_changed,mkcapflags)
-endif
 targets += capflags.c
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 80710a68ef7d..849ed7e2a726 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1502,12 +1502,10 @@ static void __init cpu_parse_early_param(void)
 		if (!kstrtouint(opt, 10, &bit)) {
 			if (bit < NCAPINTS * 32) {
 
-#ifdef CONFIG_X86_FEATURE_NAMES
 				/* empty-string, i.e., ""-defined feature flags */
 				if (!x86_cap_flags[bit])
 					pr_cont(" " X86_CAP_FMT_NUM, x86_cap_flag_num(bit));
 				else
-#endif
 					pr_cont(" " X86_CAP_FMT, x86_cap_flag(bit));
 
 				setup_clear_cpu_cap(bit);
@@ -1520,7 +1518,6 @@ static void __init cpu_parse_early_param(void)
 			continue;
 		}
 
-#ifdef CONFIG_X86_FEATURE_NAMES
 		for (bit = 0; bit < 32 * NCAPINTS; bit++) {
 			if (!x86_cap_flag(bit))
 				continue;
@@ -1537,7 +1534,6 @@ static void __init cpu_parse_early_param(void)
 
 		if (!found)
 			pr_cont(" (unknown: %s)", opt);
-#endif
 	}
 	pr_cont("\n");
 
-- 
2.17.1

