Return-Path: <kernel-janitors+bounces-2492-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BA8A12E9
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 13:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C274DB21ABB
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 11:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2727014884C;
	Thu, 11 Apr 2024 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L082FRQF"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F843399F
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712834841; cv=none; b=YHiiEEa5ctTzs1hI1YcPjDar8Mkd2zWghjR7nPOyVHYKrugsiO8HX24ljfiD6oYj8RYlNdqOg1RIUhrteKlEK39TXElCkcHdgQyq5DUHbZljon6grHABv9bIG/oz2lzC7wSDIBC3ljUPWoq8EXahk19rN4sqZdLQIUWiyt5j3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712834841; c=relaxed/simple;
	bh=SXj9y6dEQyLjYVUDk/uY67G232uAsHDAK22JxGiQ7zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMEijUzIHebIsQqXKoLMZrX7Tf6R89Ul30hDtYn/n7mLVSwrSKaenTcIbhv9/FS18hRa5uzf93z9DESO1/XsCtDFFVzMymeN2x5H4kcdX1Fpm5IreiS2i0On8FjoKZ42559ccuiT/BJbSLLZg/4tjArp9YLCxW+tUd4+FsjbPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L082FRQF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e346224bdso5874724a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712834838; x=1713439638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPgHHwHJQUjcN9+ZETRpKSXHrtMV9qPUP/hzLNBulq4=;
        b=L082FRQFnAl2gmqT3iHTAD04J85CNWw2zd7i9oITMl+sox/OdsvJ54jy4Y0iGLMgM5
         xQpmhGqv8XkoCsxEQPb6xTVUcqurpTfB8QGs4EjObDWSnRL3xaTkevjuB0SnpD2R+wtq
         Bfo6ef7cKOHy73MchxRrN+Cgg9rzH/rawAGMvL5bf5/8WTpW40ru24dWu3OWjfcQjUkX
         wGbt+6lpdkSUkU8xfF43w7214iCTYCGLcL35FJTaj5D6OumB1ayNmNIN6bN8I3gbQ5rF
         Hr+Z2cTfX/LxQPpR8OdpSGu4r/8IBJ2bf05J7woxcfg5TFazDyrsqhleR8XUBLcGMmOJ
         vKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712834838; x=1713439638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPgHHwHJQUjcN9+ZETRpKSXHrtMV9qPUP/hzLNBulq4=;
        b=W1J209P9Mduxeo/lsBZDjt6jeANIt/QALixH7NntpYP6NMkU6jjTK0cE4B0AXeJwlb
         BEg2+FYqT/UbYIrN5BkQE9aVrM2ZIl6TLfC89S0no+X4F5/ERSZF35aULJQ9IbImQ46Z
         K6NO1YIYoOyBluTwURdfzRJpzTwQ56pARMkQjIF1/rbpCeQJzutasiNgNfige8IQm5JX
         XlwCL+O/UVIJFbNO0hTfLziivCXI1xncG6ISk3hIJHJ1ts12k01hgNkyosfkfVRe+sVR
         vuMnySzNivdzKJNK8y85/v0+Wj/FU2refbCBYsA71Qr4knSiUhxmAfLbK30oKrsIBS6B
         2qBw==
X-Forwarded-Encrypted: i=1; AJvYcCU0XIdkX5EAtJXWW58xIbWtEcX3+tBj1pyag3Zd571L8zmzcNpwaT0YXagN4UwnotVuwcfNi17/i2b8xDzyYjKdkRLn53ncwCKafJWjdpBS
X-Gm-Message-State: AOJu0YyQ2lDVrpr4dQkpeiqTyd2E2sCRkv5aMItNpRwgprVsL6lPZzA8
	UDzWNUa/Xh8AH9QDEZedOQJu/uomx8xq1/z4tO15bWUgxSj01mxANBzL1JmIgNE=
X-Google-Smtp-Source: AGHT+IFwLt+iueu2j3MLe7sPxKEVm12o1woUYsl+DRSYf62oseMX9GHG+9X4QGSFZmjrEH6UfyAexA==
X-Received: by 2002:a50:ab18:0:b0:56d:c4eb:6328 with SMTP id s24-20020a50ab18000000b0056dc4eb6328mr3413547edc.29.1712834837783;
        Thu, 11 Apr 2024 04:27:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id er15-20020a056402448f00b0056e637f188fsm592949edb.11.2024.04.11.04.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 04:27:17 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:27:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tung Quang Nguyen <tung.q.nguyen@dektech.com.au>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] tipc: remove redundant assignment to ret, simplify
 code
Message-ID: <a9c41116-98b6-461b-b936-37995a343a51@moroto.mountain>
References: <20240411091704.306752-1-colin.i.king@gmail.com>
 <AS4PR05MB96479D9B6F9EC765371AA8A588052@AS4PR05MB9647.eurprd05.prod.outlook.com>
 <ce0a63fc-1985-4e25-a08b-c0045ae095f4@moroto.mountain>
 <3011ca26-08d4-4b4e-847e-d68c0751f98d@gmail.com>
 <AS4PR05MB9647FC45E89AECEDC01068C388052@AS4PR05MB9647.eurprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS4PR05MB9647FC45E89AECEDC01068C388052@AS4PR05MB9647.eurprd05.prod.outlook.com>

On Thu, Apr 11, 2024 at 11:04:15AM +0000, Tung Quang Nguyen wrote:
> >Subject: Re: [PATCH][next] tipc: remove redundant assignment to ret, simplify code
> >
> >On 11/04/2024 11:31, Dan Carpenter wrote:
> >> On Thu, Apr 11, 2024 at 10:04:10AM +0000, Tung Quang Nguyen wrote:
> >>>>
> >>> I suggest that err variable should be completely removed. Could you
> >>> please also do the same thing for this code ?
> >>> "
> >>> ...
> >>> err = skb_handler(skb, cb, tsk);
> >>> if (err) {
> >>
> >> If we write the code as:
> >>
> >> 	if (some_function(parameters)) {
> >>
> >> then at first that looks like a boolean.  People probably think the
> >> function returns true/false.  But if we leave it as-is:
> >>
> >> 	err = some_function(parameters);
> >> 	if (err) {
> >>
> >> Then that looks like error handling.
> >>
> >> So it's better and more readable to leave it as-is.
> >>
> >> regards,
> >> dan carpenter
> >
> >I concur with Dan's comments.
> >
> >Colin
> I have a different view.
> It does not make sense to me to use stack variable 'err' just for
> checking return code of the functions (__tipc_nl_add_sk/
> __tipc_add_sock_diag) that we know always return true on error.
>

I think you are trying to mirco optimize the code at the expense
of readability.  It is unnecessary.  The compiler is smart enough to
generate the same code either way.  I have just tested this on my system
and it is true.

$ md5sum net/tipc/socket.o.*
f5ebea97eeb9736c5b8097158c2b12e5  net/tipc/socket.o.without_var
f5ebea97eeb9736c5b8097158c2b12e5  net/tipc/socket.o.with_var
$

When you're doing these tests, you need to ensure that the line numbers
do change so I have commented out the old lines instead of deleting
them.

regards,
dan carpenter

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 7e4135db5816..879a8a9786b0 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -3560,24 +3560,21 @@ int tipc_nl_sk_walk(struct sk_buff *skb, struct netlink_callback *cb,
 {
 	struct rhashtable_iter *iter = (void *)cb->args[4];
 	struct tipc_sock *tsk;
-	int err;
+//	int err;
 
 	rhashtable_walk_start(iter);
 	while ((tsk = rhashtable_walk_next(iter)) != NULL) {
 		if (IS_ERR(tsk)) {
-			err = PTR_ERR(tsk);
-			if (err == -EAGAIN) {
-				err = 0;
+			if (PTR_ERR(tsk) == -EAGAIN)
 				continue;
-			}
 			break;
 		}
 
 		sock_hold(&tsk->sk);
 		rhashtable_walk_stop(iter);
 		lock_sock(&tsk->sk);
-		err = skb_handler(skb, cb, tsk);
-		if (err) {
+//		err = skb_handler(skb, cb, tsk);
+		if (skb_handler(skb, cb, tsk)) {
 			release_sock(&tsk->sk);
 			sock_put(&tsk->sk);
 			goto out;



