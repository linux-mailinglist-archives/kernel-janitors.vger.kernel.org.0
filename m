Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167463EEE99
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Aug 2021 16:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238014AbhHQOfy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Aug 2021 10:35:54 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:40618
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240138AbhHQOft (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Aug 2021 10:35:49 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6B5413F048;
        Tue, 17 Aug 2021 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629210914;
        bh=1C3RL56RVkTtjUJ5LyJ+r/R+GvbQ9mFn4F8qtny9s2k=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=JvX+vmsqMmsyRFlQ3TsEoUx03iIGB03sT2UXJiDN4aTLtTUekRTcQZzw91FTqKoT/
         u/ANURKihylRWxCtr/eRKMpVftJ8B/VBTdUNPtFs7uo3c3R2WGN+SUFR3ZscG1lV98
         c3NwcFumQf89t34i1F+AGr5uWFAqDvxzuZ0rv+GEbrPKcRFlBHAxOMv7dzqwJXu79f
         py9MvzdZbhpuGEHfG648gtD4/eoOCpGxRjwJsAB3G2wynTP700K4NrueXWvS1H70AV
         ofF6RzrebYurdGhrP78RJGR7/xzQ8MjLclvLTF1zJ35vhTZ26Jq3LWRKPwtd+s+Uxx
         TvH+b/0UqPZjg==
From:   Colin King <colin.king@canonical.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/pm: Fix spelling mistake "firwmare" -> "firmware"
Date:   Tue, 17 Aug 2021 15:35:14 +0100
Message-Id: <20210817143514.33609-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 5d2605df32e8..a0e50f23b1dd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -311,7 +311,7 @@ static int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu, void **t
 	version_major = le16_to_cpu(hdr->header.header_version_major);
 	version_minor = le16_to_cpu(hdr->header.header_version_minor);
 	if (version_major != 2) {
-		dev_err(adev->dev, "Unsupported smu firwmare version %d.%d\n",
+		dev_err(adev->dev, "Unsupported smu firmware version %d.%d\n",
 			version_major, version_minor);
 		return -EINVAL;
 	}
-- 
2.32.0

