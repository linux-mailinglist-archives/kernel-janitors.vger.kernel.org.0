Return-Path: <kernel-janitors+bounces-7361-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E14A4EAFC
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Mar 2025 19:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F7648C31E7
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Mar 2025 17:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B945291FB7;
	Tue,  4 Mar 2025 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VUOQXwyk"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042023A989
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109566; cv=pass; b=RblX7qiVQtsngxVXb2OTB3oplpnLpTdlmGEwmMMlsP9Lvq+MuKttAYIWfuc7sm7GkRM8FGB4dVaIR0FmyJr12zZ379/ElrDuhXqgYj/bW/2+ZKn7Ar045mKbrQwj5vkGuLvnsZQE+cDYf4Q2Avfsko9NuR+E0LbKmnnXqWsv5AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109566; c=relaxed/simple;
	bh=bK2QYxfhL69EA5hm+p1hxMIpBV4AYdVsRtMU8Btuowc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YTg7Sse7m9Jt2svrA4fVNvO2+09FoECW/GLUptCha6caOew+GC1pAaTPkL19BuNLoPTjzUNeMWA1Im+HOAoC0nMobXFsj1zwhw4VXPLUhWoM5l0sC7SsrdpvQuzyIZbaXO80hsT6qLfEct3Ci6+4r66wwlGne29ihUpe1Csp20Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VUOQXwyk; arc=none smtp.client-ip=212.227.15.3; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 3A65640CCF24
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 20:32:43 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gLr0GdvzG1ql
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 18:57:56 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 3469C42727; Tue,  4 Mar 2025 18:57:54 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VUOQXwyk
X-Envelope-From: <linux-kernel+bounces-541758-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VUOQXwyk
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id A492741AEC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:06:13 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 77F282DCE1
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:06:13 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEB331894239
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2301212B3D;
	Mon,  3 Mar 2025 13:04:52 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1691E521B;
	Mon,  3 Mar 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007089; cv=none; b=cpMyCf+gUDsC6WBIGjZgyDZfN7UE7fdYAkATO83fODmPtbw0r43gUnPcwA3g7BsZZG4YpkXctPHmumkEp6IwfxH/a8y9XDOAlFwbZcSzeUaWilZZsmCfu33s2rdsM8XAcFxfkP+DA6kc+mh3poLYcd3J3yZA8FmsoqCoRHFj1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007089; c=relaxed/simple;
	bh=bK2QYxfhL69EA5hm+p1hxMIpBV4AYdVsRtMU8Btuowc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dG1fwNcCz69IlVFD6gjYVU4A70DR9UEhlrKHVC4iNgWq54We9QdhddqVZazhr8MhEpa7Ncy6bfS31h1oWYgnXlWyWjGO7g1ndfLytl+MvUzBWakz6hHezOMyGfDz1lM+uWeJlsW9Zn1+JzXFBe4WjTWOO/JOJr4H7U01+9089ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VUOQXwyk; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741007051; x=1741611851; i=markus.elfring@web.de;
	bh=ZefGaaDikQnjs1LGtmcyi6zUvqK48gTikrVFialZuG8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VUOQXwykHDmRACVU8X33Rt1uW0UUPZiZAC3Wcg0Y4VnTpWz4BJHox8LC2q2aKGj3
	 /mteEDNZVtYMlJSp50eLAIXVzEQLyajTwhoQZ8gMklF1Fbplz20+4rl9bh8voktCh
	 7cEYgDwORv85DsKoYhyMiLyQD9/mtqoDk/a6zvi5VYslE9kHUVMJn5N9HurQ4F4tP
	 5oVv4t8BOx3GfzzP/nkB85IB/UxtjUUx2/CoLb1UzVdyetd4DHwEikdRx3/L0wiJj
	 21HPZDsF/vGDINJjIVvDtdhH8IrYJpCcLChljjeT/Ck9u+8UwVzVNcTsPuCaLYiBV
	 I9OSbhrL7JEIcdruKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mpl0r-1tTkt42vvR-00eFMs; Mon, 03
 Mar 2025 14:04:11 +0100
Message-ID: <535ce5e9-9ad0-4a8e-9fc2-0e759417d1b5@web.de>
Date: Mon, 3 Mar 2025 14:04:08 +0100
Precedence: bulk
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] iwlegacy: Adjust input parameter validation in
 il_set_ht_add_station()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sriram R <quic_srirrama@quicinc.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>,
 Simon Horman <horms@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d90b8c11-7a40-eec4-007d-3640c0725a56@web.de>
Content-Language: en-GB
In-Reply-To: <d90b8c11-7a40-eec4-007d-3640c0725a56@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jymu+Pr/1TM+UE1JmuPUEORIpf2+qiF1lVGAScvypt9vYK8bt5v
 idl/iM8PTR6GeLd8dQ/PV/NBe0QVMImhaGA/no3YROXP3+O/ZMOy4OehC8kK1NC2wLPrUvt
 mJEk30C10DOjyID6CK8aBMgsaNMkOjtScGq/Ry79uPBtaLQhcIZOOcMSxwHv5KgFjxKOoBL
 v2j/MsWi3yyovatcuxhRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uVOiMT9twh4=;NMDytpay6lIFj3dsqdE/Z4Yl4c/
 t592kNeaCLxQJXeAmgukVFmcI623zCrOqNmZIWtsJOfMWfm+KPzGUaD+bukKKNt9QupSsprUS
 eryIqHbO+P/CgFsCs1cljKSTsUodBNmNHfg77J9K9QBRh1hdQXs5hXrrQgcECr0ih/FdOLxp9
 2fDlGbiCR7yzXHW+wCiZk3bhQRf5T4E3x+UwpNZ2rsn+jtnlk9EEAKZpv7gtmJjOtKZt1dB1p
 yQ8kYbxeBgbcZLAFMz6ospRvWCf2B3lWMZcCRiWipObsYtnM50kFRxxFFeEXih2S2+HWHG69w
 hnd0HWQW5MbxO96aDIAvpIFGWFcPGDY9DGArE8VvtUuOeRH/jk7A/AkqBpJ5CymTc22IvTRH9
 8zdrwBZMhC4SDK8KWAbiALVy6j7y1nOQrNX89TgvE3oTACLW1/uAkP1+A2N3jPMtRyF9CZKtA
 jbLt6Fvk+0inAjpbIzXZyA05rNpP2SnBvm9cXlQGWe+/D5xoNx6cmX2vi3QNLxndGhhTWWIUO
 G2yu6Gp7Y5vZAllrjWB104TQ754TBOIZPJi7LmnCAJ3j9ej471RsuyRpHiI81YYff01NJva9d
 rsSTkuTeucTVezfTplviL/cLvGGGqIYzTqDWPhYaMPElMWJAyJEmFtpvfxceZYMA3t6nvDdEZ
 l+qWL5NbV0cdTRnnXXMCzpQztkXihe/fnS+sKq8DwJORqkMr18CUKj5t52cu4114jpS9E0d4r
 IhdFDt6gq9jRO7dADQtmHKsBAnMnjLcDK3VsJxUlaDYefXnQCGNdSrQmAEtUupKnKL0ESYJSM
 W+xqVwjbpQqGdyKGwi9xfI+wCpAxx5Sg/McPGYwVFJjKNhsv1TyDqwIZqt1JNvHQKvuTxAk5x
 FQ1LdHN7h+4+K31L9Uv/D0bjGxvNzAzkC9nXad5AZ8VZWc2+OS47kOkSeRbY9auS4jZfQCi9B
 0K5eXCYA6BCFP+JwYOWe7B2dWfhx7rFft289lQFW2cuhThgcSJk/aD7KGMORPxbRqhMem2iNE
 /Aqj2uDhNAZvQOlK/zulc6hWf0Q4ckiBnN96Q704GV988t+wFWn54jXGUbHODCfM17hBs2Suv
 wrfLBztoieDegRtA6YBhegRCL/EG1WhaB1AkEbA4y+r07nC2JkJWBVvll11IyjtLdfIn7jCSz
 pvCsN5ZljvPq3QXxY9wQTCArITqU8afvoGTFGXQbgFDG4zTO9MKk7iauXDiMQXn9IXv3Aju3u
 etaLLjGHpdY1L6t7AvuuDo9XbPTuJy3wYJXWsYI1EZqrtwrWZnJZaIsGkuojCz88m4mGL9tJ6
 WTviBm2dVQrszANHsNdjCfWLuRyhDTiMmRiD5s9tvYImRQs87/tkZQ0E2XCfA3FcPoZ2JVx0Z
 Jzxe5c4toDudXb1oe93JEGuRP3EMfJjmXDLdg3e/p7uwvAOIwB5PwuInPuBnhLLYC2XgNNixo
 iVdIJYNXq3AFU7mVU129qBvfhyk4=
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gLr0GdvzG1ql
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714258.25616@IOFtVfxw/BbErMqeIFM8PA
X-ITU-MailScanner-SpamCheck: not spam

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2023 18:35:55 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cil_set_ht_add_station=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Csta_ht_inf=E2=80=9D behind the null pointer chec=
k.

This issue was detected by using the Coccinelle software.


Delete also the jump target =E2=80=9Cdone=E2=80=9D by using return stateme=
nts directly
for two if branches.

Fixes: 046d2e7c50e3 ("mac80211: prepare sta handling for MLO support")
Fixes: e7392364fcd1 ("iwlegacy: indentions and whitespaces")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/wireless/intel/iwlegacy/common.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wi=
reless/intel/iwlegacy/common.c
index 96002121bb8b..8f6fd17b02a8 100644
=2D-- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -1863,11 +1863,15 @@ EXPORT_SYMBOL(il_send_add_sta);
 static void
 il_set_ht_add_station(struct il_priv *il, u8 idx, struct ieee80211_sta *s=
ta)
 {
-	struct ieee80211_sta_ht_cap *sta_ht_inf =3D &sta->deflink.ht_cap;
+	struct ieee80211_sta_ht_cap *sta_ht_inf;
 	__le32 sta_flags;

-	if (!sta || !sta_ht_inf->ht_supported)
-		goto done;
+	if (!sta)
+		return;
+
+	sta_ht_inf =3D &sta->deflink.ht_cap;
+	if (!sta_ht_inf->ht_supported)
+		return;

 	D_ASSOC("spatial multiplexing power save mode: %s\n",
 		(sta->deflink.smps_mode =3D=3D IEEE80211_SMPS_STATIC) ? "static" :
@@ -1906,8 +1910,6 @@ il_set_ht_add_station(struct il_priv *il, u8 idx, st=
ruct ieee80211_sta *sta)
 		sta_flags &=3D ~STA_FLG_HT40_EN_MSK;

 	il->stations[idx].sta.station_flags =3D sta_flags;
-done:
-	return;
 }

 /*
=2D-
2.40.0



