Return-Path: <kernel-janitors+bounces-3046-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA4B8C0DE8
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2024 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C93FB20E44
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 May 2024 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D2514AD3A;
	Thu,  9 May 2024 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2qOQS6E"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923614AD24
	for <kernel-janitors@vger.kernel.org>; Thu,  9 May 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715248791; cv=none; b=sf6EZ99gNSkUlJ5I5b4OmCRRKXGDB0oAi/NHXzh8Y+krdvqeFl7XaH8JEfOjR9IkQIbdj+CVBEhClyUL5k7XlvudQdg2eAOiWEMoeccsvg3wopQT9pti2LW6zqvtisY5397MtgjSsAj+NUJzBb1UOn4DiQK1yb2+Evmw+Jw/Q9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715248791; c=relaxed/simple;
	bh=vAA13b7P3kVq/+RAFJXOYAjvaVdl9qZ3lyYPS5otTnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLCx9xl5O61lVMJRa8MnLIH/Zy4hxRrB8Ls6yiD+uz32i5fzfqNlibcEcff3m4a5LQe4oXHOKRNcA1WMWfIEaXz+0/NrBNekZcjSv2N/Y9UDULRw0TSasFjkD4n/2SwuHa0z1/zg81CYCaisVfh/Ulxg0y1AwruRJXH1+JDurEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2qOQS6E; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59cf8140d0so151642366b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 09 May 2024 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715248788; x=1715853588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vAA13b7P3kVq/+RAFJXOYAjvaVdl9qZ3lyYPS5otTnA=;
        b=W2qOQS6E3K4ahREBr8hrdQOAHM9nHaEvvnxWIm0vGbhDtw858+Wz1xTe3MbFdnnLN3
         pTMNcsk9YyuFp5XONQBIj2lkmoxOyyiojnOWrFJXKyYbdu2ILlDrI1HEr8vRuevBjkw1
         uKDsy4MSZGqaoi7s+pyGv71HhBmDTU1jRxbY7+BUMkuA/gFyyOYKrEslN2fbXBHMb5Cz
         f8kXxPTf84fm45XSoOMAZhrt6P4Qz5prOJOVneJk9V3wcWXLHLhFt+LiW5nSr6HW3FZ7
         Aai1jIoOR2mh2rk2N04Yz8rBqy7XYHyMbNrk61QX3qY2L1T0V5qMFJRiaLpnqAbLGDZg
         tpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715248788; x=1715853588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAA13b7P3kVq/+RAFJXOYAjvaVdl9qZ3lyYPS5otTnA=;
        b=cPQfkcS8ZS5utv33akOXlWnXoMW+EsuKFhQYYIw3mmoxGKRXY3bx6ttA8YZ32lLosr
         QfgHm+6EGxJzHHA05gMLUSrDz9oLDzrT59AYWe3ooumoxZvwDc7AHymLRqADs9TTa458
         lZBDDW3fxaagcRvf+VcLCrcj73rTfcvjLX2dMddq8eERlNJ565k6voMzzGStFQZVUF6/
         aD5r/XY+KceHjv9Pt0nLUPye/rLlCONUvpZhZwyHeZABYXHIpWWyzFl9i2F5/NNHeyJJ
         bq2Mz4JXD5RHUlxdf7eOEcxb7Qywdb1WIgz/+tu079ZPgfnBTHoVFEuFnwSR4R0YE3gv
         jJrA==
X-Forwarded-Encrypted: i=1; AJvYcCVYa+8ZcLJLPyVQp218gA0A28BBromJg3iDdJ01FAuZXL9cLiG1SH7bzBgD3gWHSAJutfnvo1YTxTlHA7oU080n54XritVjIGgUhKjjWzFp
X-Gm-Message-State: AOJu0Yxi8W6W2vpgLeYywbbyb8BwR90hUkFkO6+u+aabberuOBMlchdN
	Fw1qf7ekAoUd7978cQZWNsAlEAYIZUaoQWH8uNJH3NhHV59uyiMs2uQKxXqlBr1QduWKaqtIKc1
	r
X-Google-Smtp-Source: AGHT+IG6R7BLV/bmTcIFwSbDC1bMFzF1pWWCeqzJAHPNppoxKmA+Nqmks67h6FPVR0skwmyHv2tJtg==
X-Received: by 2002:a17:906:3296:b0:a59:9ad4:6f42 with SMTP id a640c23a62f3a-a59fb9b8298mr343794666b.58.1715248788259;
        Thu, 09 May 2024 02:59:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0193dsm54636866b.169.2024.05.09.02.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:59:48 -0700 (PDT)
Date: Thu, 9 May 2024 12:59:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Levi Yun <ppbuk5246@gmail.com>, kernel-janitors@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] time/tick-sched: enable idle load balancing when
 nohz_full cpu becomes idle.
Message-ID: <c01a0e7b-96f6-42cf-9e71-8118640abf5b@moroto.mountain>
References: <20240506213150.13608-1-ppbuk5246@gmail.com>
 <67be5fa1-3b5e-4ec9-ad8e-1e230e618e98@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67be5fa1-3b5e-4ec9-ad8e-1e230e618e98@web.de>

Markus, kernel-janitors doesn't need to be a part of these discussions.
Could you please stop adding us to the CC list?

regards,
dan carpenter


