Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380977B0467
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 Sep 2023 14:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjI0Mku (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 27 Sep 2023 08:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjI0Mks (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:40:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3F8E6
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:40:46 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so9320825f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818444; x=1696423244; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec4SMHCZi6pgNOcJu9vO4u2B5NawDyQ3mb0ukxQO0Ss=;
        b=bU2htXUToSz8hn65ia9VNsTxk4v3FprhQwCbhtunzbq7HSswKNl9Hc+m8GRVTMG94V
         t3j6SH2FobwEfzqkD5t8A5YizJJz4gCOiYD00PycMjEZQB4Z1gOU+8ZmNd6XpSP0UyuD
         sCU9i2O11v5H8kHtsB8q8DQaeGDctFZtz0zCPUEBFuS4OXOPCzp/M3C6XVxx1Z1xczkB
         y9GxUGIudlR00DZOi0wvhnSE6ZLYqZb7xTUbTP0VyyRJfYmaZs9sSmCie1qF52+3movW
         O/gzufKCjAYicPH9IDnxTeBZzPklfzeljK11/FeCJhVJpJoCsyc7TVgEm0n7ozXz99t9
         2xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818444; x=1696423244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec4SMHCZi6pgNOcJu9vO4u2B5NawDyQ3mb0ukxQO0Ss=;
        b=tcV5eWPBZBRg1IYcrfhMmgFoD/KiTwX/3tvBv+5Fv3unp6zPbplhZr63YOX9/0FEkO
         pzHFGlntpXeISAZezOIWjl3YpimM3Z0PTrb7IA75xsjLV89lNvgxRUUNoRrQQGuzCzPI
         6rZu39tnSRobcvsPRNMIFUeQxTtXSasSj27UmMe1J+pOB6qr8I8rUUfAAr9WS23eQyS7
         v4GRjx4t4abNlskc4YftnDvKl1FA2qgRccSX68BvdcVmWsm5x4Rm6Z2YaaSrqLfZKj86
         j/JIwPcH5MPwZyVSGwmfZiei+5F5pj7rgr2Cqlwz90IzaGnNXdDumpHncFP5NgpON5aT
         WkcQ==
X-Gm-Message-State: AOJu0YzgYJvScn8TRcwdp+vbLDxyzDt5fhuTOO5rqjXGrt4MOtKar6Lv
        sgh4/96wdtyYU3C2MCFuodcusg==
X-Google-Smtp-Source: AGHT+IHEsIxfVLB7b3x8QYt1iYrP/EUgmLcuincn5ES59JkIOT+1b9kyKKfJ+E6qXMVqZqcpxMKZ+Q==
X-Received: by 2002:adf:f78f:0:b0:314:1ce9:3c86 with SMTP id q15-20020adff78f000000b003141ce93c86mr1435838wrp.0.1695818444650;
        Wed, 27 Sep 2023 05:40:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b12-20020adff90c000000b0031fb91f23e9sm16966293wrr.43.2023.09.27.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:40:44 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:40:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Gregory Greenman <gregory.greenman@intel.com>
Cc:     Kalle Valo <kvalo@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Shaul Triebitz <shaul.triebitz@intel.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: mvm: fix an error code in
 iwl_mvm_mld_add_sta()
Message-ID: <75e4ea09-db58-462f-bd4e-5ad4e5e5dcb5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path should return -EINVAL instead of success.

Fixes: 57974a55d995 ("wifi: iwlwifi: mvm: refactor iwl_mvm_mac_sta_state_common()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I copy and pasted this approach from similar code in the same patch.

 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c b/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
index 1464aad039e1..f2e952481ff8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
@@ -707,8 +707,10 @@ int iwl_mvm_mld_add_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
 			rcu_dereference_protected(mvm_sta->link[link_id],
 						  lockdep_is_held(&mvm->mutex));
 
-		if (WARN_ON(!link_conf || !mvm_link_sta))
+		if (WARN_ON(!link_conf || !mvm_link_sta)) {
+			ret = -EINVAL;
 			goto err;
+		}
 
 		ret = iwl_mvm_mld_cfg_sta(mvm, sta, vif, link_sta, link_conf,
 					  mvm_link_sta);
-- 
2.39.2

