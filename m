Return-Path: <kernel-janitors+bounces-10-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7607DAA88
	for <lists+kernel-janitors@lfdr.de>; Sun, 29 Oct 2023 03:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85131B20E68
	for <lists+kernel-janitors@lfdr.de>; Sun, 29 Oct 2023 02:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502FFA53;
	Sun, 29 Oct 2023 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRjEeplT"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67487377
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 02:54:21 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F9FCC;
	Sat, 28 Oct 2023 19:54:20 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-577e62e2adfso2325065a12.2;
        Sat, 28 Oct 2023 19:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698548060; x=1699152860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8Ad4IK0kybFM1k7TSKyGMSMPkHhzxeJmmhckcgCxTs=;
        b=VRjEeplTlHJG+1oPW7VaXi79RrZhjVrXsK37Q7KMhRTk6l2hXoQyY+xkqctXwtd1H9
         TXrnSIZpuz8TeWGKhn8iaETUOqghco5pLO7qc30JOvmYK7ZkpOeJN62QLXb62ghEubmb
         LqCb/beHdtGKNJnXvGiaIdVLNizN0xZitVf1qOXY7Kc9lEyKisSac8/aK269XFlnW5JF
         C5xcOhCR5ggydArp/ulKMD+x2Px5fZu+1/WCwCx6fZryp0aJJwMhY+Se//CbNzNWOKaJ
         kUnmPqIP5864olzVemqvtLaD7wdlLImFQqo7+JllUDlBjIxF8rFHmwkPnbAQ7aebo7gF
         dduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698548060; x=1699152860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8Ad4IK0kybFM1k7TSKyGMSMPkHhzxeJmmhckcgCxTs=;
        b=TNG4QSQsiyi4JUc/V6XVaV+YBbWK6dB6C2JtEYpDHjhMHG9MJj4Gs5wbgrLeqXDikU
         +wdk2TrUxIsnToYE8xa+b3TgxLweQvGbPaER83kgrw7ySTCWbkkxvxUWeL57LLPgYMnL
         RJYYsotXNlXMs/6KKfqp/UVs2233GeNbfaeiZl97sMM8c2se2d7bAUrCq/irTO1MTTm5
         IGH2AxpqDws+7CVrCVFutbxNMWBsj2r+djjB3SEry+1+a0lgC/4YsyNtki19Lsw7JAgn
         ltJOIwp008Veomj8SiUCynU2XNH5cVO1X3cosWQxg14PwdS81D/I7IXx6og2UVpt3Gjq
         6tKg==
X-Gm-Message-State: AOJu0YxEOPFPR/5BSQY8cYzuuU5vQeXxHrB6jaOl5g6HOM8H4rAq7HA6
	WUX1XG8mdcQNeFlCJQoxyME=
X-Google-Smtp-Source: AGHT+IH1ZIjgKbDJu+Sz7YzWme1WJLgfKnF/NCTVyOfOOjc8KwHzbgtC8BAdZ3gnqrF3EwzvfM1q/g==
X-Received: by 2002:a17:902:f1d1:b0:1cc:2456:c17a with SMTP id e17-20020a170902f1d100b001cc2456c17amr3193184plc.33.1698548059529;
        Sat, 28 Oct 2023 19:54:19 -0700 (PDT)
Received: from google.com ([205.220.129.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001c60635c13esm3798662plg.115.2023.10.28.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 19:54:18 -0700 (PDT)
Date: Sun, 29 Oct 2023 02:54:01 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Nick Dyer <nick@shmanahar.org>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Christopher Heiny <cheiny@synaptics.com>,
	linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4 - fix use after free in
 rmi_unregister_function()
Message-ID: <ZT3JSaeOOHYZpKb8@google.com>
References: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>

On Fri, Oct 27, 2023 at 03:18:28PM +0300, Dan Carpenter wrote:
> The put_device() calls rmi_release_function() which frees "fn" so the
> dereference on the next line "fn->num_of_irqs" is a use after free.
> Move the put_device() to the end to fix this.
> 
> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry

