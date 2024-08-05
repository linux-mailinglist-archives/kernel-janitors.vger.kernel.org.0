Return-Path: <kernel-janitors+bounces-4912-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754694758F
	for <lists+kernel-janitors@lfdr.de>; Mon,  5 Aug 2024 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59A21F217E4
	for <lists+kernel-janitors@lfdr.de>; Mon,  5 Aug 2024 06:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3F21465A3;
	Mon,  5 Aug 2024 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hoWU7ZkO"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC313F43B
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840614; cv=none; b=HhsbbrMjZuyFX/8gT0CveLMBGj9L9johbLUi7GwdvvWjeaUbJ9fPwuzm/mi0QP3ruBi2l+USFF4MfObrW3uPVkfSOLAv9r4CbaPSiU4GegBbXPuULQmOt0nqYbydwEXBcGKMCVZ04PfJWLtULvlNp0wLZFHg+e8z8NoG+hIdS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840614; c=relaxed/simple;
	bh=FOxLg/rjd+wx2gGUg26Wm5kTSqi5cfymcYGSwAhPckE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKA955LuYuvNlhJy9K1I0bclZtWoXcrbVeFlpPXShMdx/yJdH0SSOezxquffrchLSEGnFmxB2jzNl1bz1cJB0/oPzTqg6JbHbovrQvuqVtylbXsHUBu/HHLTDEDSoE6aLCxTPH6R0eDfCRaVf1o8zuS7uvf8JP6X33s6NbakWkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hoWU7ZkO; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id arOns5eD41n2IarOysUUU1; Mon, 05 Aug 2024 08:41:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722840065;
	bh=BTMGc4u3HwGHSgbua/br9tG9eY8eSlRj2fRBlapv5XQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hoWU7ZkOdBOFpDQo3fOvMRWc35GG2wcIDzG5LTLNRtGsWVyjsz7c9oHoBbTGrCBgY
	 hIjitd8nHnAlqknNUyBpozmaq7SMxxBOLsvyJ89V+CJWzrAvyMQhT5WMMInw5f3tqr
	 Vq8nj6fvxp9EYj0vEiBR7erIp1Gh9CHv3jU65s8y3/4in/51F92q7kPvnYVO7Y9f0p
	 EL7wWzpesIOHgLjHExDH1KI8umY+GFtPNXOz86l1riwNTRnxL5+ucrgEgngeeZZunN
	 yh9+KSJvypK8GFo9q6NFpDiZ4K/u85ojHtJQsMzR2P2dvo9EfVyD8SIJr/XZkB4UHJ
	 GkwbZ3QQvZmjA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 08:41:05 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: stas.yakovlev@gmail.com,
	kvalo@kernel.org,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/3] lib80211: Handle const struct lib80211_crypto_ops in lib80211
Date: Mon,  5 Aug 2024 08:40:37 +0200
Message-ID: <c74085e02f33a11327582b19c9f51c3236e85ae2.1722839425.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
References: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lib80211_register_crypto_ops() and lib80211_unregister_crypto_ops() don't
modify their "struct lib80211_crypto_ops *ops" argument. So, it can be
declared as const.

Doing so, some adjustments are needed to also constify some date in
"struct lib80211_crypt_data", "struct lib80211_crypto_alg" and the
return value of lib80211_get_crypto_ops().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - Update ipw2x00/libipw_wx.c as well   [Simon Horman]

v1: https://lore.kernel.org/all/d6306f7c76015653e9539ddbcd1ed74d1681a98f.1715443223.git.christophe.jaillet@wanadoo.fr/
---
 drivers/net/wireless/intel/ipw2x00/libipw_wx.c | 2 +-
 drivers/staging/rtl8192e/rtllib_wx.c           | 2 +-
 include/net/lib80211.h                         | 8 ++++----
 net/wireless/lib80211.c                        | 8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_wx.c b/drivers/net/wireless/intel/ipw2x00/libipw_wx.c
index 903de34028ef..dbc7153d0a3d 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_wx.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_wx.c
@@ -509,7 +509,7 @@ int libipw_wx_set_encodeext(struct libipw_device *ieee,
 	int i, idx, ret = 0;
 	int group_key = 0;
 	const char *alg, *module;
-	struct lib80211_crypto_ops *ops;
+	const struct lib80211_crypto_ops *ops;
 	struct lib80211_crypt_data **crypt;
 
 	struct libipw_security sec = {
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index fbd4ec824084..c730d921463d 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -474,7 +474,7 @@ int rtllib_wx_set_encode_ext(struct rtllib_device *ieee,
 	int i, idx;
 	int group_key = 0;
 	const char *alg, *module;
-	struct lib80211_crypto_ops *ops;
+	const struct lib80211_crypto_ops *ops;
 	struct lib80211_crypt_data **crypt;
 
 	struct rtllib_security sec = {
diff --git a/include/net/lib80211.h b/include/net/lib80211.h
index 8b47d3a51cf8..fd0f15d87d80 100644
--- a/include/net/lib80211.h
+++ b/include/net/lib80211.h
@@ -92,7 +92,7 @@ struct lib80211_crypto_ops {
 
 struct lib80211_crypt_data {
 	struct list_head list;	/* delayed deletion list */
-	struct lib80211_crypto_ops *ops;
+	const struct lib80211_crypto_ops *ops;
 	void *priv;
 	atomic_t refcnt;
 };
@@ -113,9 +113,9 @@ struct lib80211_crypt_info {
 int lib80211_crypt_info_init(struct lib80211_crypt_info *info, char *name,
                                 spinlock_t *lock);
 void lib80211_crypt_info_free(struct lib80211_crypt_info *info);
-int lib80211_register_crypto_ops(struct lib80211_crypto_ops *ops);
-int lib80211_unregister_crypto_ops(struct lib80211_crypto_ops *ops);
-struct lib80211_crypto_ops *lib80211_get_crypto_ops(const char *name);
+int lib80211_register_crypto_ops(const struct lib80211_crypto_ops *ops);
+int lib80211_unregister_crypto_ops(const struct lib80211_crypto_ops *ops);
+const struct lib80211_crypto_ops *lib80211_get_crypto_ops(const char *name);
 void lib80211_crypt_delayed_deinit(struct lib80211_crypt_info *info,
 				    struct lib80211_crypt_data **crypt);
 
diff --git a/net/wireless/lib80211.c b/net/wireless/lib80211.c
index d66a913027e0..51e31316bcb8 100644
--- a/net/wireless/lib80211.c
+++ b/net/wireless/lib80211.c
@@ -34,7 +34,7 @@ MODULE_LICENSE("GPL");
 
 struct lib80211_crypto_alg {
 	struct list_head list;
-	struct lib80211_crypto_ops *ops;
+	const struct lib80211_crypto_ops *ops;
 };
 
 static LIST_HEAD(lib80211_crypto_algs);
@@ -161,7 +161,7 @@ void lib80211_crypt_delayed_deinit(struct lib80211_crypt_info *info,
 }
 EXPORT_SYMBOL(lib80211_crypt_delayed_deinit);
 
-int lib80211_register_crypto_ops(struct lib80211_crypto_ops *ops)
+int lib80211_register_crypto_ops(const struct lib80211_crypto_ops *ops)
 {
 	unsigned long flags;
 	struct lib80211_crypto_alg *alg;
@@ -183,7 +183,7 @@ int lib80211_register_crypto_ops(struct lib80211_crypto_ops *ops)
 }
 EXPORT_SYMBOL(lib80211_register_crypto_ops);
 
-int lib80211_unregister_crypto_ops(struct lib80211_crypto_ops *ops)
+int lib80211_unregister_crypto_ops(const struct lib80211_crypto_ops *ops)
 {
 	struct lib80211_crypto_alg *alg;
 	unsigned long flags;
@@ -206,7 +206,7 @@ int lib80211_unregister_crypto_ops(struct lib80211_crypto_ops *ops)
 }
 EXPORT_SYMBOL(lib80211_unregister_crypto_ops);
 
-struct lib80211_crypto_ops *lib80211_get_crypto_ops(const char *name)
+const struct lib80211_crypto_ops *lib80211_get_crypto_ops(const char *name)
 {
 	struct lib80211_crypto_alg *alg;
 	unsigned long flags;
-- 
2.45.2


