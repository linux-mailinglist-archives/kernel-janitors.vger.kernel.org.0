Return-Path: <kernel-janitors+bounces-5507-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A297B918
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2024 10:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82051F242C4
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Sep 2024 08:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D071922CC;
	Wed, 18 Sep 2024 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ckuC0Om9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE0189BA0;
	Wed, 18 Sep 2024 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647189; cv=none; b=abbJ+cOKPsipZqfOWj1eZeBV1YJFVPTxEvBWwuEoHCo2CHGicYE63L2niq95OGjwlWFpFnHBB7bn9DJ9+st2NglaslmGMnoblUmDSmiWI6yczji3yqf+rKjL+KBz9Vuc/BtOimqS/FsAfIU4fnDDUfditC+X3xA7Ze7rDssUwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647189; c=relaxed/simple;
	bh=ykfMzlPUMMa0Z7Gq1bunkKZMbdyybMY1mZyrStzwaw4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=LphIPG5LFYJiT3Y+itvxXoMYDELZZ+DeDCh3Vr3qGYCCxo9XEWHT6BIueaun1Pg+z3Qg0m1lAXoXoYE1HuqgcNW26HhHFptQWoPFTJ68GhRWnffTKMFTrNJBwnp9qRLQink6dYmxBKf2mNeuXqKLqmOQTOqQPpKUaoNq2/grhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ckuC0Om9; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726647163; x=1727251963; i=markus.elfring@web.de;
	bh=kInQ//rPSsqlgcK7FpGZP43VvDdx4dvgsVxHv3VH3nI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ckuC0Om92SIu+UHVBmv0FIG+p2lPJY37ZtpYU6/TF8VabNiMYID6V2d6PoOP49Yv
	 hyiZKldZckMoa5Zz8eECGaMEBgwECB9kzeYssSmB912p7Pf8CIne30bdzdkCIdoKl
	 SZ8ADiEVc4ZRrXaa0nG1u1tzGJAjFkQaaEHdoH7Zkn2VbFsYeSgwKDr8oRuZzLv+S
	 3Sb3T+0cdZS+qma0CV9RR/vISMHaTeOqzI6wcpSNBIbiEYvFrL2kbND+ul+0S9rxz
	 wueje130/Hj9j0uweR7R2Wb/1OIZ02hLXn4pfzXr/W5hc4X1IMGKpupCwOT/XBHKQ
	 IVVI4hBJe6hK1TXOoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mfc8y-1sJhy70VPE-00ixjw; Wed, 18
 Sep 2024 10:12:43 +0200
Message-ID: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
Date: Wed, 18 Sep 2024 10:12:14 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Philippe Lecluse <philippe.lecluse@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/xe/query: Refactor copy_to_user() usage in four functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1KMy0yAdh4GMhkxbk+tvy/qZLdxiPwbW85tozVJiNzbZLOB1351
 y1EfCORR2QuAvKPUa3Uu4Ky2IV+rP4QYTjXAWmNPfRbFlIwWIc00b9COnmrgieUmd6iIzpC
 fdVGkt7xuob2v19OTCBJk5tqpLbZ5+ESSPbTb+cnm9KVR2HlxH3Y4UZ4bb14+s3XPmzZAnM
 bJiYIpXwLw0AGvmQ6xqjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mr+sK1Kvv0Q=;TWQfCzjh0yjiyT5cJLK1+Oj1u3v
 dXTfDQggGDJfrvpK2pY7OBiGx+Xux+scjcqkAFHmbvRfW/+//rno/UCiYTVDCJ9WxVz3EF7I3
 fQ2PFV4VgTvr9gkW3q83We0dkBQ1zvnU1o110qtWEjsvHRy7h7uA1nFP+Xo9CfuUefbrwuCT0
 WdulMAy4IIoETB9dUnzgA0S2gpvVT8jNCzkm8yz1oSZxmBLx1a5LznByJpW+mcsK/47Z181sl
 Hd8Sq6AmG1L/VgLg98oFh204tqmTn4eE8PbNb8d59fFUaGWr2U1PTz+dEv6Z7XZ1x1uY4xVZE
 WslD4da9QagicmTTrAS44yHzmIG+tATnuFXgyCyW2GWuoq8RBHYxgPH7F31jS2zICTaVQge6X
 hUbdEgJQ5NYRDW3qA7+CSnmm4BUYHf1mShwG2oR1NGae1UAhSeUSQ2F0nL+QFDbrfzLlARTjW
 2yn9y9xdjQJkFX37oehc6UKArgxmVg3RFsfoYiS35sX2H/a75NjAaqC8z0z5KT58NpRQvbQHN
 t5dG5QYn6veLuwu42vQVGZ2pYB95nzDxVdcEe5QL7WPtyWjYcqe3diaKIARppGWbEFGBkImPL
 7wOd/FDULHDc2Wk0Fid9SxcnToQH9pvfMBGWz3Sr3K46v5xbs5ChQCtkbh5ONjJFGJDKHtMWs
 Jx0NiR18sXnotG7RrRxvNNds9m4t2o5Jls6Mv8IgUR3SRqD1hZYVB5fk3Dt+aN+X2MxmxW7mY
 zNhnctiU0cPC2JJJvtf3mYaKeWkWvjAHnj5y6S4crqtUnI2XwuIwIIPBr56YVKSwxZRzoMlcb
 iQARlY43W2pNq031OQGlTs8w==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2024 09:43:07 +0200

Assign return values from copy_to_user() calls to additional local variabl=
es
so that four kfree() calls and return statements can be omitted accordingl=
y.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..6195e720176d 100644
=2D-- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -220,13 +220,11 @@ static int query_engines(struct xe_device *xe,

 	engines->num_engines =3D i;

-	if (copy_to_user(query_ptr, engines, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, engines, size);
 		kfree(engines);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(engines);
-
-	return 0;
 }

 static size_t calc_mem_regions_size(struct xe_device *xe)
@@ -344,13 +342,11 @@ static int query_config(struct xe_device *xe, struct=
 drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =3D
 		xe_exec_queue_device_get_max_priority(xe);

-	if (copy_to_user(query_ptr, config, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, config, size);
 		kfree(config);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(config);
-
-	return 0;
 }

 static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query=
 *query)
@@ -414,13 +410,11 @@ static int query_gt_list(struct xe_device *xe, struc=
t drm_xe_device_query *query
 			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}

-	if (copy_to_user(query_ptr, gt_list, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, gt_list, size);
 		kfree(gt_list);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(gt_list);
-
-	return 0;
 }

 static int query_hwconfig(struct xe_device *xe,
@@ -444,13 +438,11 @@ static int query_hwconfig(struct xe_device *xe,

 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);

-	if (copy_to_user(query_ptr, hwconfig, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, hwconfig, size);
 		kfree(hwconfig);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(hwconfig);
-
-	return 0;
 }

 static size_t calc_topo_query_size(struct xe_device *xe)
=2D-
2.46.0


