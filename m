Return-Path: <kernel-janitors+bounces-10187-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JKbFM+Dh2mwYwQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10187-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sat, 07 Feb 2026 19:26:23 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B327E106D84
	for <lists+kernel-janitors@lfdr.de>; Sat, 07 Feb 2026 19:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93C553021E72
	for <lists+kernel-janitors@lfdr.de>; Sat,  7 Feb 2026 18:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865B2336EE7;
	Sat,  7 Feb 2026 18:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnOPcUjb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573C2EE611
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Feb 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770488774; cv=none; b=MxniaW2BikiGXEMOCX019ledj3ef/s6LSGEe7O3EUCaSaT4bJ4T4Icsu38ulT2MGbdvNhYrUkBScY5wrCweDmGhjOkBJLtPq1K0uFOVWhT56R7RkzOB2ZZrXgO8k2fJy+9uywcI0ZtkkuUkxXwt2Vps/sJEtlraJM0GPRQRzVSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770488774; c=relaxed/simple;
	bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=O7+99s3WCXLuBHgpuxnDBEDnEkyhPH+AKOUv4VOocZdCjLcI6H9O5wcAfmtOXkaaKAcAqko4H7AUYO0nh1s32vZJrdzsk9u4gcMTGjaEiGp1cIcMfH/hd76FgvKDd9YOeEQBCtNfs4sltv+8HQa+Wc9xnDjbm2b3Gt+W4k38ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnOPcUjb; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45f126d47b8so1212779b6e.2
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Feb 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770488773; x=1771093573; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=ZnOPcUjbWeq5Tnzms7pisG4S1y81DLl4kfPMyUHyAvUyFC/KHKCpOMZjKFbnXYezzc
         WpNY3sXC45oi2IuE0vwc/bqwMoz346XWbtPppC28ZwKEijx4nolwi8WmMGMABogU/qkz
         rmAsavwq+EiNrwlSzdCymbcYLkN+vOqaKWIYr/i/ePnMd7yIabZsEnPwb1Be5E/jlOvS
         nImr5hwpZqia8VIVdS8WKzp16GdLi7p0M5vWs+bgjd3PoJylLdeYepz3QpAkVt7zU4G/
         nqEiqA6OuTJlPdGdrXFAxsOMidhHOhv+AhWAM1k3z/8/ksZIQauNMfeXM39wB7J1pM1Z
         ukcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770488773; x=1771093573;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=qCmVhnqghcLQ2F/nkURyA3sh6PeDQQg9HaYHM7dxN70zSOaPdX5hs1kk24LpYCkWht
         RWeMA6oGp/AKhdyzAyhF3wQ8QO8JyMjkwDXkmMEKBUX8NtyRREJtewFeq7sIOcKg4JiZ
         F58Th184RQdWrRnkb2wE82dkzHY/5DojxJhbAP5rBbf3mlUidxieVh5C2tpCBNVWPOIl
         VjOHvO6x1t0wmous1y0DtgrvbpMRShsVDSWGgktxXkd8bOE1crtKrcNLoCtc1WPhRr3s
         qcmigE3daALepr9e10WJi63npfWZlHki1VFLIkrbSK4vozMacChbO6w8mYO94Au7NP5q
         jXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQIKAPsaf8T+3vJXoSrmRefbezDJg8rvILV/Ms73CQT+hR425Sl6saVbtgQHUSa86InZ6cZGvf1dK4rx1IQIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HatqAlvtC8egnZnCMyJvu7J779YvxlXVyEGKuhnEiRBaaeW4
	jbWVLBCf1bI/KcSAmHo+43ylA6ycDItyQod96q2cY7NF8wpUDsRLwchN
X-Gm-Gg: AZuq6aJblOGhH+0jgFM2yyvkHUXJqwH7dSjntcjY6dG7ygk+9LhhzFt6wyI7wkNUJxG
	G+9RI4xlKG6Klecbshl+2YOIXW0/FfD/8DahhOO0Egx58T6PC5m9erFmFISEDbOkdTebxp74xUy
	xqKqSbo+KkzqF/Jb69XZj5EQDGhxeY+SUusOryPUrp9RO6jVG2bxzEtqOu58YfucRVu5IwRQsus
	MqyChgaIZTrZs6bkLQzGO/gHofYlyMmoOXeObFu5XcrYtqZvL/LlcCwsxKXaqmhF9Q4mh6mP3q2
	soK9SaPXgWCZ4jQ6i+UaSjj9MENCiSliPpqotZ4wa8TSN57Qg2ShFzo83CyFcouDJ8v6KqG74KO
	CigNRywmnGcBKq127S77Xvi5CFnNNdSU+d1tZn5fEYLM6ovG9sSur7Yz3nQfF3Vq6RP+QKEX3lL
	/4uLSqJxW7L1ppWWMagbpT9C1NSI8RSQbmFJctrh2wCAjwLFc0ZkRyqOjCCztjNUTDYitxaS0iL
	rE++7YmzY0cGkqboOTj5uP2yBGkGkGi9qd6OgUB9H4SgyxA5KHweOkI
X-Received: by 2002:a05:6820:3088:b0:663:859:c41e with SMTP id 006d021491bc7-66d0cc377bbmr3117593eaf.71.1770488772635;
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:106d:f0c:a2a5:1623])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66d3b2a5aefsm2974879eaf.13.2026.02.07.10.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 12:26:11 -0600
Message-Id: <DG8XW0Z05J2W.2PG3PVJ56TIM3@gmail.com>
To: "Sajja Easwar Sai" <eshwarsajja20@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <iryuken@duck.com>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260207180934.73593-1-eshwarsajja20@gmail.com>
In-Reply-To: <20260207180934.73593-1-eshwarsajja20@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10187-lists,kernel-janitors=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,vger.kernel.org,duck.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,kernel-janitors@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B327E106D84
X-Rspamd-Action: no action

On Sat Feb 7, 2026 at 12:09 PM CST, Sajja Easwar Sai wrote:
> The debug code is guarded by a constant false condition and is never
> executed. Remove it to simplify the code. This also removes the now
> unused variable 'pattrib'.
>
> Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

