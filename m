Return-Path: <kernel-janitors+bounces-3874-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEA3903DD1
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 15:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C6FB259BC
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB617D374;
	Tue, 11 Jun 2024 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCb3wBhc"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BB17BB35
	for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113419; cv=none; b=MOYufM6sJOhmktlujfrB9Wu8PeKA5Nh/QcDJWkuQCmcrw3YXwjTEhT1u8MC2RyUjiKCHMM5hBKVPXRX1Dz+7BdzJ1xa0NdT4AokCjZYTlvEPFTK03Htm3n1ZK+pAKn8GQfqTJslpX/PErKCDWLHalY8pWkVhi/+7S0dj8b1mWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113419; c=relaxed/simple;
	bh=G81nV/OBlKorj/bQSO/0m/YS18F0sOKnJ5vEEXLKL28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fylog9pipu33qjAdZJrJmctLNo4Kfdug7yVtdrLUo+NUgZvLBCXfhqsWEVTNcYfgouNDsjpnLzJeDjx037NhU39D1TEOAOZgsJ87CEDezd4ZY/mYfxJH4KUcshdGA7ylG8EQfaVOD2fwpiAlTRVouuhTlfowrJeykovdMObzCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCb3wBhc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f223e7691so1540813f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718113414; x=1718718214; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQ7yuVnrb4EU6Lvo4BrfJFZP/ygleXZBaqxVgqydxfE=;
        b=hCb3wBhc9BrRjGKRkaXMiKH5ypW1jFoYA22tESQuIbmisQc+PS44TJUPX9KIekvOMb
         JMCsP+rCTQrTwZXZusnRkQFZYsFrDYvM3ZLT/m6vjrop0MJMaAmNxtLTR73VhhP4KBo9
         1hC5F8F8MEQTEK9/QA5316xswh2CImzDwybwy6Lwc3bvTrzA/vMPu9o51GdSEGW3nvx/
         qmWYBBhq6kXw7a6cmPeRgGb4KMy1Z9ZzaU17bu8OQeEFyrtaVhed/2opQriMuTtqdvPv
         wSV9qj39VdJ07VF2LrwJpModBBVHDgI6JvZmPXqz0uEnsOUzPSAsL94PIEB96Yr77bcO
         dJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113414; x=1718718214;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ7yuVnrb4EU6Lvo4BrfJFZP/ygleXZBaqxVgqydxfE=;
        b=C+U/plg2SxqjyTurt4zTIolseKukMcR4mUuRKOyvT76zMKcPIYO/2waFXQB/LXdm5C
         LKTeXpZTHxwQwmt67ZcIUxMwW1L0zVW7dtZjtaCM2YY+fvnsTmunOHAmeYetp0FMbB9d
         cKKM1xBJ7stM/vsG963XoZ5tu978dYWAxOYhKpQGqZV5DQMyEAqSslTqi4o9KyrY9l5s
         gy8mzPFAr5nJXwbcNhjeAAuAR5t0Ye2LBvomAmDijAtWugwI59ectUi0AzLUAmhAnbCB
         DpYJRlTdIz4OSDqErts+7nIkk5+7gS6XPCkE8RNRAfiVONwpLu7h4OeYV/AU/ohcvluv
         9EGA==
X-Forwarded-Encrypted: i=1; AJvYcCVjCgVqNmf9tdRHgjNRopLM1SRbxVQPTnVOGXNUriBW/gJ6iyer94gKdk8kak+Qrw6cEi2oopDmkFzLV3oDFCbw1DhPjjE6MlXjTJlGHsvX
X-Gm-Message-State: AOJu0Yy6Fr8N4TJcSPu6F/ftFILTTVNChOIs3G9rQPHDFpfCoZGP5bmN
	zImWVNyXOKURLvgQPfUBM3bwoFx2t+xjAXWX6jbXkvBeEIdOGD2/C30gfaXkJm8=
X-Google-Smtp-Source: AGHT+IG7eYrNSeCHZqPcrPgnGK3VTAV/7wmKdDROJn5gJB5qTGNwoOifQ9hHpzWobxzk5D8LUqFv/g==
X-Received: by 2002:a5d:6a4e:0:b0:35f:24d9:e7dc with SMTP id ffacd0b85a97d-35f2b28c102mr2348777f8f.19.1718113414183;
        Tue, 11 Jun 2024 06:43:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f23c67e70sm5704051f8f.33.2024.06.11.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:43:33 -0700 (PDT)
Date: Tue, 11 Jun 2024 16:43:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
	Sasha Levin <sashal@kernel.org>, Tom Gall <tom.gall@linaro.org>,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v5] checkpatch: check for missing Fixes tags
Message-ID: <ZmhUgZBKeF_8ixA6@moroto>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This check looks for common words that probably indicate a patch
is a fix.  For now the regex is:

	(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/)

Why are stable patches encouraged to have a fixes tag?  Some people mark
their stable patches as "# 5.10" etc.  This is useful but a Fixes tag is
still a good idea.  For example, the Fixes tag helps in review.  It
helps people to not cherry-pick buggy patches without also
cherry-picking the fix.

Also if a bug affects the 5.7 kernel some people will round it up to
5.10+ because 5.7 is not supported on kernel.org.  It's possible the Bad
Binder bug was caused by this sort of gap where companies outside of
kernel.org are supporting different kernels from kernel.org.

Should it be counted as a Fix when a patch just silences harmless
WARN_ON() stack trace.  Yes.  Definitely.

Is silencing compiler warnings a fix?  It seems unfair to the original
authors, but we use -Werror now, and warnings break the build so let's
just add Fixes tags.  I tell people that silencing static checker
warnings is not a fix but the rules on this vary by subsystem.

Is fixing a minor LTP issue (Linux Test Project) a fix?  Probably?  It's
hard to know what to do if the LTP test has technically always been
broken.

One clear false positive from this check is when someone updated their
debug output and included before and after Call Traces.  Or when crashes
are introduced deliberately for testing.  In those cases, you should
just ignore checkpatch.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
v5: Change the output:
OLD: This looks like a fix but there is no Fixes: tag
NEW: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?
NEW: The commit message has 'syzkaller', perhaps it also needs a 'Fixes:' tag?

v4: Fix another formatting issue.
v3: Add UBSAN to the regex as Kees suggested.
v2: I fixed the formatting issues Joe pointed out.  I also silenced the
    warning if the commit was a Revert because revert patches already
    include the hash.

 scripts/checkpatch.pl | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b812210b412..df99f48d824f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -28,6 +28,7 @@ my %verbose_messages = ();
 my %verbose_emitted = ();
 my $tree = 1;
 my $chk_signoff = 1;
+my $chk_fixes_tag = 1;
 my $chk_patch = 1;
 my $tst_only;
 my $emacs = 0;
@@ -88,6 +89,7 @@ Options:
   -v, --verbose              verbose mode
   --no-tree                  run without a kernel tree
   --no-signoff               do not check for 'Signed-off-by' line
+  --no-fixes-tag             do not check for 'Fixes:' tag
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
@@ -295,6 +297,7 @@ GetOptions(
 	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
+	'fixes-tag!'	=> \$chk_fixes_tag,
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
@@ -1257,6 +1260,7 @@ sub git_commit_info {
 }
 
 $chk_signoff = 0 if ($file);
+$chk_fixes_tag = 0 if ($file);
 
 my @rawlines = ();
 my @lines = ();
@@ -2636,6 +2640,9 @@ sub process {
 
 	our $clean = 1;
 	my $signoff = 0;
+	my $fixes_tag = 0;
+	my $is_revert = 0;
+	my $needs_fixes_tag = "";
 	my $author = '';
 	my $authorsignoff = 0;
 	my $author_sob = '';
@@ -3189,6 +3196,16 @@ sub process {
 			}
 		}
 
+# These indicate a bug fix
+		if (!$in_header_lines && !$is_patch &&
+			$line =~ /^This reverts commit/) {
+			$is_revert = 1;
+		}
+
+		if (!$in_header_lines && !$is_patch &&
+		    $line =~ /((?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller))/) {
+			$needs_fixes_tag = $1;
+		}
 
 # Check Fixes: styles is correct
 		if (!$in_header_lines &&
@@ -3201,6 +3218,7 @@ sub process {
 			my $id_length = 1;
 			my $id_case = 1;
 			my $title_has_quotes = 0;
+			$fixes_tag = 1;
 
 			if ($line =~ /(\s*fixes:?)\s+([0-9a-f]{5,})\s+($balanced_parens)/i) {
 				my $tag = $1;
@@ -7697,6 +7715,12 @@ sub process {
 		ERROR("NOT_UNIFIED_DIFF",
 		      "Does not appear to be a unified-diff format patch\n");
 	}
+	if ($is_patch && $has_commit_log && $chk_fixes_tag) {
+		if ($needs_fixes_tag ne "" && !$is_revert && !$fixes_tag) {
+			WARN("MISSING_FIXES_TAG",
+				 "The commit message has '$needs_fixes_tag', perhaps it also needs a 'Fixes:' tag?\n");
+		}
+	}
 	if ($is_patch && $has_commit_log && $chk_signoff) {
 		if ($signoff == 0) {
 			ERROR("MISSING_SIGN_OFF",

