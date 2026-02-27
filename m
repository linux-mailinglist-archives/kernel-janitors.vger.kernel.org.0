Return-Path: <kernel-janitors+bounces-10232-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJaALhcmommI0QQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10232-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 00:17:43 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EA1BEF5A
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 00:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 856D130913E1
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Feb 2026 23:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8633F36E47C;
	Fri, 27 Feb 2026 23:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiDjsdS4"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF763364E91
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Feb 2026 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772234249; cv=none; b=UfN+l+qBcZUlbIWMjB9xPlKND1QUIMC6plr7Q2+UIPQJ9/M6lv7N33Q2/haYoDqgdZYjiA+ED2MxEbtIhS55SKv1My22v9Z77e64jqD/33Bs02O/G5xfCaF1ZafZngFGlZ0wiQ8ZmXgOREkCNexfFDYVeOlBqg7EyGe7FylpzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772234249; c=relaxed/simple;
	bh=GVLJMA3GGrhSf/iJqPVBOLm5U7ULMbsoNhWfdAiG+Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ra6m8DiVB6ipkz77QXIqtcj6TdLgmFPLEhaVagi+DfQ9SGdlfFVQGtvutpJU4P7kDurt2ym6yGpSxAe+lbRVeQL53xRHsdit5wqjPsObcvliHpH2UNmwo+zQx4nyp+p/vAsy+B9X9yLE/JO3iLQtkKe+RxgeyXRxU5G0yj5VUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiDjsdS4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so29486525e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Feb 2026 15:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772234245; x=1772839045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tf5BsDzyZHlIIGQLAFzNJuW7CZ862XMnhMQbP/B+AUU=;
        b=KiDjsdS4jlztwhy903GQ+eYosYmUfW3cxSI4+fmet7kT6l0y/GN8dIi9yw1lFDfcte
         8qdv+zE9AhJ7HFDUGIZLFCwWA9Q+Z7LZ/BdMmBw53DF539ehUX4bTZhRWqchdwG1E2BV
         SXk4CHZLaTuu7ZFsrDsFQOdhUPUXk7ozGIWZY2cjVxD/T8as/WNacMjU3fsE+gjUIX6T
         R4hsfO91jnJwGaEXiGgxSHVC0EBtw7lQPL3qLJ8/EuiyEA7pamgn3BjHATXAxY0Ko/NW
         o4fPQMRI0QOIWTnptkVET5qrpw1b75UI6YjIEPZpFPoKLYwafiDK3bPLxSf6QSl7wfS5
         +ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234245; x=1772839045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf5BsDzyZHlIIGQLAFzNJuW7CZ862XMnhMQbP/B+AUU=;
        b=KpFkqsZ5zm36soRC4x3xHUCqbojszJF0Z8wF4VbfBa71l5wqn3h/QJ3wNLWWescwIQ
         aCa/PuI+RiJmquPiKGBWHT3zY7SzlQi/tktDMRwMUxAzAbAb2hxN9cAptVbHq3Y8DQbp
         /RYVOfhbiedP8Kf+AxKLZfa84hNu0AgVYqwbNBHysDIvNOn9pWBHq71O8Gd2XXugoY5g
         ZjPPf9jclBA+ZGub/awnBe1KfM6Ijs7ViiQzWLS0qev212JQQAsKyIouNhfRAKZysbwk
         aJHWAQ5HnBOengN4kcTGoRudJFaaCzsRc6NG3owgZp5OoN3OQOAfDDWL9U67jkPgI14s
         ey7g==
X-Gm-Message-State: AOJu0YyjGIqZXLZHWLX3KrI9AkTmzJNNN/IAmbPaUGaFkaeES2RYdpIK
	WpRjZYHYFU339rezp81zCSnpvZSK7fHlG2ygfeRxv9sCVUyfR3NP/QHj
X-Gm-Gg: ATEYQzyhpZA8PnGtDgynTgW+FQOlKV4Xtg7WG5TECm1Y5jnSSdV0EcFejxgKc1e1dVW
	frBVMWg9M8rDmbiKLhFfe8kmPNQQUfCV6y66UYmwaZ63J18G5ITrfUU304cQT1R2FurDm6c6jY/
	ygwAc7j305vO0XqVRcI5qHMRD8Co81EkIbJo798oR1FlorTZYbKRAutffHXC7u7uFWuBPWyp0Y8
	hN5Uq/f8fmFc2iNq97cUvZDRMszzePXNMvdU4sY2tuGteg41RxbKesi1MKwiK9XhEGNNplGi7M4
	OBxC2OydlYJXg92bxdsZi8QeaC9ixzEhYBVzSA3xRG9O7QRg1KLMgYUXD74Fm9/sWoCneozF1cN
	QXOOyomLsaWn7l2FvoPL51qzGcdupbZi6vD72c/PfAWeoYAwTRtB5lVI7/mQqt2PpqrTI/Hci4z
	2BK5lbgQ5klDgY626MyDiT7twF5CZNqvsG
X-Received: by 2002:a05:600c:8106:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483c9bb6559mr71896955e9.4.1772234245150;
        Fri, 27 Feb 2026 15:17:25 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm126995695e9.1.2026.02.27.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:17:24 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: hid-lenovo-go-s: Fix spelling mistake "configuratiion" -> "configuration"
Date: Fri, 27 Feb 2026 23:16:05 +0000
Message-ID: <20260227231606.421263-1-colin.i.king@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10232-lists,kernel-janitors=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,squebb.ca,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,kernel-janitors@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 417EA1BEF5A
X-Rspamd-Action: no action

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index cacc5bd5ed2b..dbb88492fbba 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1401,7 +1401,7 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 	ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_attr_group);
 	if (ret) {
 		dev_err_probe(&hdev->dev, ret,
-			      "Failed to create RGB configuratiion attributes\n");
+			      "Failed to create RGB configuration attributes\n");
 		return ret;
 	}
 
-- 
2.51.0


