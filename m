Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A31A7CD46
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jul 2019 21:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfGaT6J (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 Jul 2019 15:58:09 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44568 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfGaT6I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Jul 2019 15:58:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so30924781plr.11
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Jul 2019 12:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NfIspcnc/2t7LWXrdNE+ubsJCC83+V9yAq4B7B5lNHE=;
        b=Q4jgwY+JqY8cWP5Ba3AUxsKHoDBJfSroGhiXbMR6OrTJimuIBMapLxpymuNCBbRYxm
         ncoDEJL5taLB4w3SrlTtacnLIUIGo18Ay/EoIuMP3Iq+TOLJs1WFQHKC2FYJFAYTKqjY
         XJ9EHmGJnbi6QNDD4KlOHD+Wnl3OqbAoM7DXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NfIspcnc/2t7LWXrdNE+ubsJCC83+V9yAq4B7B5lNHE=;
        b=mICYatiTmRjFnYCdjcI5hUN0C5J5IYxz6psN4WOyjzOg8JC/I0MRvpuLUmNlsFxnYk
         /p9ItMWPthoTJXuTXvmL1DihVXbYUH6LQECQJEy9NKmB3u+oUUB6KyZWoz789KlSjDeC
         PAeI/7nK8kRXVxTsU3l04nzhCmT+lgHytiJ536UWUfVbwSgd0JfybAWLpboeVQ5Gb0sO
         Pq4H/QU5Mcf783vsOjIOvRt1NlvkEQI4L3s6jLQTYpDx/aMvN5ufwaegaXAYopf15rx+
         PFcK4ayB69peSaEslL4XqryPFwNUDq1kdjzRuwK/DwCwBgmEdJjcCiBT6L8stg8un3nX
         NboA==
X-Gm-Message-State: APjAAAUbV/fE+6Lv44ggzQbmYS7S/eORs+pN0tUEUt8Ta/VXRMbyINBE
        2MM9ToLR4XARJTZoJ8AudW+fMA==
X-Google-Smtp-Source: APXvYqw+WHzdDfbYGy29+WSP8iMiYjFhVylC6I4hxMOf3DMb3RNqGFamdATEt9zqoJx2J75sr60bUA==
X-Received: by 2002:a17:902:8205:: with SMTP id x5mr123929051pln.279.1564603088343;
        Wed, 31 Jul 2019 12:58:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v12sm2495362pjk.13.2019.07.31.12.58.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 12:58:07 -0700 (PDT)
Date:   Wed, 31 Jul 2019 12:58:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joonwon Kang <kjw1627@gmail.com>
Cc:     re.emese@gmail.com, kernel-hardening@lists.openwall.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        jinb.park7@gmail.com
Subject: Re: [PATCH 1/2] randstruct: fix a bug in is_pure_ops_struct()
Message-ID: <201907311257.8436E997A4@keescook>
References: <cover.1564595346.git.kjw1627@gmail.com>
 <2ba5ebfa2c622ece4952b5068b4154213794e5c4.1564595346.git.kjw1627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ba5ebfa2c622ece4952b5068b4154213794e5c4.1564595346.git.kjw1627@gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 01, 2019 at 03:01:10AM +0900, Joonwon Kang wrote:
> Before this, there were false negatives in the case where a struct
> contains other structs which contain only function pointers because
> of unreachable code in is_pure_ops_struct().
> 
> Signed-off-by: Joonwon Kang <kjw1627@gmail.com>

I've applied this (with some commit log tweaks) and it should be visible
in linux-next soon. I'll send this on to Linus before -rc3.

-- 
Kees Cook
