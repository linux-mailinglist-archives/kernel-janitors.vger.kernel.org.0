Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E79BF9C3
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Sep 2019 21:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfIZTEo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Sep 2019 15:04:44 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42237 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfIZTEo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Sep 2019 15:04:44 -0400
Received: by mail-pl1-f196.google.com with SMTP id e5so27915pls.9
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2019 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=PdYLRPjVhmUjIHCvi4UHiPrAhU+guddA20JI/+5rxjY=;
        b=Tmtc0Nn81wHG/k62e+8O6WqFzOrbw0joaXuZw8CeRv4NGBJO34uREGUVrM15NlRNd/
         KXVCm56+bWElYHYeQ0R4kjyNu/FnqC/9+MEKDrqK72lW7/l39xNoG1fS0Zp6CKUdRLsZ
         gXVsZtp5tT32ZBWw5kC+fU1woWzttqHBQPRNrIgNylvWWDlRDJ6vWAz34kj719Yq98p3
         vPKRfVpuDaJP14Ay3aL4z0RQGk3C68gzKCjF47xNVleC3oQoXXVewTZOq4iSAuA8BBDy
         v7MVN7GQVjR3R/y4nGJ8xwBHz5ZnXg5WVCmwB6dZt1h+ke9BhQTtxSVdOqPqRUM8SiAP
         Pe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=PdYLRPjVhmUjIHCvi4UHiPrAhU+guddA20JI/+5rxjY=;
        b=k0pw1GOCbe0LsW648NYzhZ0VQXcQiqbv4ev995lp6ZXw0OrA+GC+zxlRBGCd7DYWak
         O1SJMApNhox8zoUPrijchQXSW4gl8xGBcpaCO9Tb19mNMRVbgSJCUi6m4vnlwf2ASpJN
         br8PbaRCL3Xga/TQF1QEZjbFfm059uRVf1TmkrkRDaaN5e977Nr+c9fFLzGUSvw0rNsj
         2YZVWSu8THdzJA3mWUN7fsMfbPSWb8dW2KPoXuy2+FQW+6okZ6JXhneW2PH1yIf1tkEp
         oTDmnce7BUXKknLuYR7MmbN5hZwEE+I6LTwntMDjb+Fcm/BgFpIqxlkqfWXpSK/vGpcQ
         hEJQ==
X-Gm-Message-State: APjAAAWRlYA8NWkaY7A0OW4MPGfKPWmMEoF0OP7P8Ys1UsI9TCllhyhl
        dMYTwbTW6mBqqoIYKEffNy3+tdSmt3Y=
X-Google-Smtp-Source: APXvYqxEUiBxfJzjbBHftgh1abveLyXbMBtk+9b38TLo3+MinOv2vGYAtVPqpE0JbpSEN4PmoAzjcg==
X-Received: by 2002:a17:902:a508:: with SMTP id s8mr67402plq.317.1569524683474;
        Thu, 26 Sep 2019 12:04:43 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id y15sm24796pfp.111.2019.09.26.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 12:04:42 -0700 (PDT)
Date:   Thu, 26 Sep 2019 12:04:42 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        tglx@linutronix.de, Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm, vmpressure: Fix a signedness bug in
 vmpressure_register_event()
In-Reply-To: <20190925110449.GO3264@mwanda>
Message-ID: <alpine.DEB.2.21.1909261204300.39830@chino.kir.corp.google.com>
References: <20190925110449.GO3264@mwanda>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Sep 2019, Dan Carpenter wrote:

> The "mode" and "level" variables are enums and in this context GCC will
> treat them as unsigned ints so the error handling is never triggered.
> 
> I also removed the bogus initializer because it isn't required any more
> and it's sort of confusing.
> 
> Fixes: 3cadfa2b9497 ("mm/vmpressure.c: convert to use match_string() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: David Rientjes <rientjes@google.com>
