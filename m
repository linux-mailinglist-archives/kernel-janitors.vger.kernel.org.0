Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8452E781D47
	for <lists+kernel-janitors@lfdr.de>; Sun, 20 Aug 2023 11:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjHTJ4t (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 20 Aug 2023 05:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjHTJ4p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Aug 2023 05:56:45 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC425EC
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Aug 2023 02:51:44 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Xf5hqwKJwP8tnXf5yq04iR; Sun, 20 Aug 2023 11:51:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1692525103;
        bh=xUAxdVub/AJ+VRGlEQnfzOuYX4A4nb9Zccn+S71HYZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=NfzR/IjDZ40zGycbfjDDzkgeDFTXqcbyXeHzNfyH6CTMb3WZEVKRZRuzjC/Ir5Dkh
         gerYCTAE7onbbJENf54GoFGBPotX5ic2qaNE7a9yiUzgKEx8vdeMTD3YcCnhhY9SwW
         q//Tvb0bhxnq8XXbaJze3okmXz+02MTTT0BAXMWXmYbwU6tyUhxid/xNSWa5uMnAp3
         ASMVJcnwB+MEuksol/U9hUZVmOGJ6vbngxL8B1eI21/GDO8/9LmVyIccSQy8GiqAog
         716A6jC3nw9p/czfdaC1TAewtB6cIwAkaP7NCOt8HOt8RrL2n3DKERU1CSNmXl7V/s
         YVjG5VwH7zS9Q==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:43 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        Felix.Kuehling@amd.com, Arunpravin.PaneerSelvam@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/4] drm/amdgpu: Remove amdgpu_bo_list_array_entry()
Date:   Sun, 20 Aug 2023 11:51:15 +0200
Message-Id: <978444d1ff97c07c71473152728cc146d9cac419.1692524665.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Now that there is an explicit flexible array at the end of 'struct
amdgpu_bo_list', it can be used to remove amdgpu_bo_list_array_entry() and
simplify some macro.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 16 ++++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index c8f59a044286..6ea9ff22c281 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -87,7 +87,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	list->gws_obj = NULL;
 	list->oa_obj = NULL;
 
-	array = amdgpu_bo_list_array_entry(list, 0);
+	array = list->entries;
 	memset(array, 0, num_entries * sizeof(struct amdgpu_bo_list_entry));
 
 	for (i = 0; i < num_entries; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 368e50b30160..6a703be45d04 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -71,22 +71,14 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev,
 				 size_t num_entries,
 				 struct amdgpu_bo_list **list);
 
-static inline struct amdgpu_bo_list_entry *
-amdgpu_bo_list_array_entry(struct amdgpu_bo_list *list, unsigned index)
-{
-	struct amdgpu_bo_list_entry *array = (void *)&list[1];
-
-	return &array[index];
-}
-
 #define amdgpu_bo_list_for_each_entry(e, list) \
-	for (e = amdgpu_bo_list_array_entry(list, 0); \
-	     e != amdgpu_bo_list_array_entry(list, (list)->num_entries); \
+	for (e = list->entries; \
+	     e != &list->entries[list->num_entries]; \
 	     ++e)
 
 #define amdgpu_bo_list_for_each_userptr_entry(e, list) \
-	for (e = amdgpu_bo_list_array_entry(list, (list)->first_userptr); \
-	     e != amdgpu_bo_list_array_entry(list, (list)->num_entries); \
+	for (e = &list->entries[list->first_userptr]; \
+	     e != &list->entries[list->num_entries]; \
 	     ++e)
 
 #endif
-- 
2.34.1

