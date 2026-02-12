Return-Path: <kernel-janitors+bounces-10192-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFsSFzbpjWkm8gAAu9opvQ
	(envelope-from <kernel-janitors+bounces-10192-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Feb 2026 15:52:38 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D112E982
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Feb 2026 15:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ABC6301878F
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Feb 2026 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE0935C1B7;
	Thu, 12 Feb 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy/OL3ty"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C912765D2
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Feb 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907681; cv=none; b=fxwh581/7EyndhmNkATEyxwtNCk/k2N/YlVmKXhy81IQaxmknN9zJNB8mZmDPIMPInfwjU4LMj8g1YVr92ohucmCB+DFP0shgFM17P2a2l/b9YVOOsoLh3SL2TRn+QlzwlKE1ewKhKf6p9rZFFEi8uZVDVMBCU/Zogjhv7lzXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907681; c=relaxed/simple;
	bh=cCBuVJmRgWGVz+FUryWdOYRKjepeIp/L515kv50aW8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkL9tOWtdknEP7fBd4LFSl8cu5pCkMPkuYaMx5EPiyKJ+2L/iuTNkEmWWAvmGNAeqRkseychY9FsRdxiyHHQXmkCE5ffX4Vx4A6gU/49msU/5t32j3obQfs2mkVcwOpwy+5u5mKGJslmt70ccjUziKZF6DNVU3iivgyQ5WLZlQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy/OL3ty; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aad9b03745so11320725ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Feb 2026 06:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770907679; x=1771512479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaVpje2PuDDNuSA9HTG3fBT9pKVKtc0HtLGMI/E0PSo=;
        b=Zy/OL3tyjfs1Lif3J2V7vKAyKzSRQhjNF/2H9Inpdg1hEu5/RmRKOLKBkIx5xRJ8Bk
         TC0jNbnG5sKlhLjVYi9nwiujfaXPZDfHSODb3dhJ5IPiRH7S/921ag+d7xhF/NXP9ng3
         /hng8JJHN+NPuFx3bxf54tVhxuVZoVW4mWRe1f+PfASZh3q9CWzxleSo29+9GmCZxr43
         dAfELQvPjmrfp3WqsJOl0iBgqL3Y3u/bUblsrgF1REUoKXYXt0IaePsGtqJl5plstZ56
         /SLMhanOouwxmPfjSXZT1CMPMBZplA2qb5DvNkrM9vea8xGIzrJaevnqiTeilCV/ogT+
         6PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907679; x=1771512479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RaVpje2PuDDNuSA9HTG3fBT9pKVKtc0HtLGMI/E0PSo=;
        b=WSh2K+IF4zybo/fMwEdy4PrOj0Cdompu6CO63QztPrWCXsGI1zutQEJzcy3K1rsduT
         Wfpe7Glcbm+fD24xRynkMB6TXDWlOXaBhIrEiC4b667BVRLOC59iy+5ZwQs85KFAZMGC
         sY0a7qJB8qHCdt2BwrhjhSjC/o0LZYm58Bys/WUZ8ULVLMH0eUGNiEE30BhNDLuqBppK
         ZUvFVRmnvxFaIb8KE0GZqGdCgRNkTmU/8XQr1C58nTNZMH00bI1stKS+r5FCsxzDAwZS
         zLBSua3R2YIiO1FZ8Jflc7lk4GlvAxR3kKYiq12MvuAk45KYa4hARclc4bQoEkT14kQO
         gl1A==
X-Gm-Message-State: AOJu0YyL28+Tr+W4Q+FbRFn9pS3B6Ing85F4ssSctUMtxsn9/vB5yUSp
	o1g5Uc4rIDlqtA331ZLmrUy9hiCQg6M4CsEsg842nbvyII/kcU/iCla9
X-Gm-Gg: AZuq6aJKNvR8HqjPbYQgcfMfiKAlNlqOuuELwxpQGwFZT2YaV+Wy9gWFZzQR24QgsXW
	IAUPT+BUCeJiLAIkg8lLq2aQ7eBM5++z9JIeMTea1mTJUElBKJIMcHSqUiJlwPxE8/0fn+NjSfM
	vBSYeAIy/aO6tB/KA4kG4umcTH6XUH+SZ977YvL3B8RVROxjsBJ4stuCr6fGAkoCaY7OHzsK4H/
	MD1pD6Heu4yE3ckYFhkpR6nAchikl0awf4uVddSOLUK3PubPfiliYzVmFEzV8spgtWvqUeibsxa
	aDpZ2BqSgnoDZ1ITDj5l5EK9GPXjEbgZgOtjhxWiPHTsr37iM+hoIp2mJz9+nOszL7NXbt3//jm
	+pny6PdrpIao/g0lyDZwr62w56tALMMIjKoTNQLN+3Yk1FGU8lESvA+Yu+Xllc9aqi0SRtYGsal
	fgKVgX4+wzE/4zfpOyI3v2lTemZBkWjGem/UsHesPKB3TYVczuEU/pmxZD3suLZ57C1n7p2dSPC
	Q==
X-Received: by 2002:a17:902:c94f:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2ab3a652937mr30808005ad.3.1770907679293;
        Thu, 12 Feb 2026 06:47:59 -0800 (PST)
Received: from sean-All-Series.. (59-115-196-175.dynamic-ip.hinet.net. [59.115.196.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2c522a60sm52698565ad.63.2026.02.12.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:47:58 -0800 (PST)
From: Sean Chang <seanwascoding@gmail.com>
To: conor@kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	seanwascoding@gmail.com
Subject: Re: [PATCH v2] riscv: fix typos in comments/code - CC Conor
Date: Thu, 12 Feb 2026 22:47:12 +0800
Message-Id: <20260212144712.15690-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211-trash-eldest-aebdecd512c4@spud>
References: <20260211-trash-eldest-aebdecd512c4@spud>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,dabbelt.com,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10192-lists,kernel-janitors=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanwascoding@gmail.com,kernel-janitors@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[kernel-janitors];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: D96D112E982
X-Rspamd-Action: no action

Hi Conor,

Thanks for quick feedback on v1!

Fixed your comments:
- elf.h: coorespends → corresponds  
- processor.h: requries → is required

v2 here: https://lore.kernel.org/linux-riscv/20260211175429.94329-1-seanwascoding@gmail.com/

Please review!

Thanks,
Sean
---

