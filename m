Return-Path: <kernel-janitors+bounces-10237-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDq+AeS8omkS5QQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10237-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 11:01:08 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD01C1DBF
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 11:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85897302F734
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 10:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E71E39E6D9;
	Sat, 28 Feb 2026 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7tGOjlM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC35410D08
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Feb 2026 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272860; cv=none; b=tpApMZSBBqZwXzUMckCP5YNtVPBSzWYEorP5S969gsrZKPuudRa01vdodSUiorr9qA5yl4gRbb2+eotutXG4GQLzrK+nrhNRSEaKKVsZiniwLf2COJ2lIUoOYlPkCcP+tGtya6ata8NKfF6iamWqLM/izoV9Fflg14JN90MdOa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272860; c=relaxed/simple;
	bh=SyVPaUo+z+HYEidXoc21BGkOE7CxnTuR2yUK55P6/Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uMsXnOL6El5dEaApyKK71al5fPRhkp9u2ETW6MBuciqUY37C+E6HcHI5qpJOBLpEIZS7HBBi9J2d9rf93Cx1MmmGe7MmCjIgLyFuuCvSosbIbDO2xQOcT9zARPdNiC21PQfc2rXKdsURrIlyZRd30pi3AL86lkC+9KqnLEHTsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7tGOjlM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436e8758b91so1847187f8f.0
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Feb 2026 02:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772272857; x=1772877657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pi+GFLSwi3pjYjAmI89JNYKtrRFb4ualdoW7/2mbzi4=;
        b=L7tGOjlMQVgGz8tkwaoNLwl+hNMlPCNTJi/D5Af1NfHAp1cmIMQAiDfhwoknrNry9h
         pn3EeIY+pSIDYYr4HxJwJRa7KAOOwBfFAU8HtdXKfzC5ZTPWF7CR8twLG383nnXTmBQd
         28y89qPxig1S4HzyzfvXBTUxbgBqrbb8BANsMGoacJQFSuZlQQ2lxJwmdnuHX/0+YVQD
         bJiZYobMJDekXhAfU3SDnqFFZp6iCuAJu5BDvD05+FzT14/qfizLO550ugehQrxCI+hF
         ZR+RAYVTxrPDRL3MLdiz97bSZJs7v9x8uAlykgii5ZTbemcEPwqn+pCOQjPRmRX0Ivz4
         TWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772272857; x=1772877657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pi+GFLSwi3pjYjAmI89JNYKtrRFb4ualdoW7/2mbzi4=;
        b=IuxtLp3HWCFVgMfiQah3b/Bud2p725IYn8qn1CHMu0fKSOk1RHsRScAaMjB2xXPmk+
         zraY5A719ZwWPCSwii7nmtEB/cVxcPdlIYt3faFb2/fbqjT1kzrFv6gqUTnEDDrNS2RD
         gUBkskQKXJnKS4TWuyVFIrrTBO2RPx0T29Nz/dbVfxMseu8LFarAXJLQwikEtqcaOf1R
         NFauiJUxjpg0pcW6NzX/3ODajeibg/peUpj61rhZJW0gfjRkYsMPpNkFgjKeW32qhO/e
         GGG4WoJ2AZkX7LEbVE5rKmqdRhwxb/+kgRWfrGrhI3wAyqOeQ9drOTr8z2yUNcnUh3GM
         xJGA==
X-Gm-Message-State: AOJu0YxiF/VDPI/21G7rXQnUlTHtE2vuF+JY0O+XQowDF535sjXgt6N4
	z4HNbny0UwIV0HqtXQeRYPvE+CBibNlktD1lz7wOf6BMxBwuFQ31cK4L
X-Gm-Gg: ATEYQzwR7FC3ogLqHZpwqG3ND9lRICgHpe5MN2Ts2N1Q71hHGaBmQWv+xj1KB77W/u/
	EDW0u/SbwtePf/8/m6ut6t88PKGjjXMEvRqb0ZuMS9UDqrGfKr6qdlF62hSL0PBkhHWXPw1+FZs
	THe9Nu+VRo/7pphZ6KKk2IT3FWqGq28V/br8AdjxDYuTbfoCWpvIaM6R3wxnDvOZFzJMb1wW0bx
	oys1AN9usV65/wGR14Ut4ieBHd7DwzlcuGEUGesfMJw2vhIMtA7Q7lb4k1mOOIsiEhGrybaELXB
	JsNUlqc8d05bFd05OolVklxWXXUoepXajiVsHGWYnL2Wxt+wciVjaRjwjAnCntpFHbICc6nK8s7
	yDEvarHKtaHTGbrpm61ONhhLwAIMJh6gAqB5XLem3Nt1rhwskIORpXODElphL3wXDK8a+xzQ+Dq
	lkxbYLAnr7d5lAutBa9ZRmCQ==
X-Received: by 2002:a05:6000:288c:b0:435:b7ca:7521 with SMTP id ffacd0b85a97d-4399ddf211fmr10631779f8f.15.1772272856846;
        Sat, 28 Feb 2026 02:00:56 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a523sm12770570f8f.19.2026.02.28.02.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:00:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: remove extra ; from statement, remove extra tabs
Date: Sat, 28 Feb 2026 09:59:38 +0000
Message-ID: <20260228095938.548728-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10237-lists,kernel-janitors=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,kernel-janitors@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CCD01C1DBF
X-Rspamd-Action: no action

There is a statement that has a ;; at the end, remove the extraneous ;
and remove extra tabs in the code block.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 71cfc623bc2d..f3fa8eb4bcce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1165,9 +1165,9 @@ void dm_helpers_override_panel_settings(
 		link->panel_config.dsc.disable_dsc_edp = true;
 
 	if (dc_get_edp_link_panel_inst(ctx->dc, link, &panel_inst) && panel_inst == 1) {
-			link->panel_config.psr.disable_psr = true;
-			link->panel_config.psr.disallow_psrsu = true;;
-			link->panel_config.psr.disallow_replay = true;
+		link->panel_config.psr.disable_psr = true;
+		link->panel_config.psr.disallow_psrsu = true;
+		link->panel_config.psr.disallow_replay = true;
 	}
 }
 
-- 
2.51.0


