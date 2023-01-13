Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1A668FDB
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Jan 2023 09:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240923AbjAMIBB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Jan 2023 03:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbjAMH74 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Jan 2023 02:59:56 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322326B5B5
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Jan 2023 23:59:53 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id z11so30140248ede.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Jan 2023 23:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnHbH8z/0UrE79uXH0uK/safm3GXRV2WsqxSNHfUHA4=;
        b=rxQ12wFZZic/MFea44lF/Hxy4P9PqtVLt/sd0DBj1WEJ1ycC/bwQncVuuv7XOf2aHd
         kBKvBOtwPhmnfPVAZeB7sf5OR0eeMMfHaUka7mYMIFCuu+tv86U2QrqAmGHb+NIyYGYv
         5dmvCApyCHhsKrYyWEAHwXIFOdVSsS7EKaFF4qFH9eRjENMiBkfDOxyBb+m+TlF76cPg
         3R0uJGYkGC6cYG+mVNJVVXkws0yHmkJhLt8U65Zg5YHfW27RQ0g2FaZo4gmsu5qq29a6
         1s33RTc0zMsftLiUumpauZtBo+u1rTDkp9HpMzVlZp+5GxS0aLl/hbuD6d/BEqlFJ5+f
         p7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnHbH8z/0UrE79uXH0uK/safm3GXRV2WsqxSNHfUHA4=;
        b=1ha0qFPhfw+Hps4jRRM74Mbl5mtANN/hVR6vLOpre/p7VPrPWv5fCNrS22i0txXWiD
         BZHCg97JUoYcID/IXQGgVmp8pBY1PkrKYxfqaQS1F0sVoaBqien6OJDAFf7zLNZCTgxU
         M2tKzr6zCpRYyoowsQCNP1hv+fuIewDgRobK6uxDZfbgNT/zlzjR+JccDaVnbS9o9ad2
         fvnsxzgzSi2KltMmCpjDJvGhxw6qEk3MsjTZr3x30mGTSIWjGSv2pcalp3eORDCYkGsU
         H81Paw2KLmVCfU22XrJRKVVV9dLJlcmIA+6FK3cFvBSZezhWYKSCswrfdCnDVY6na+x6
         lw5g==
X-Gm-Message-State: AFqh2koQd8E9aJHNdE2tmiITQf96WGL8/iiV66X/8dV43ZVXoIUyJFYs
        +ztpZRURaAYxPxqSYC+iCjFKkA==
X-Google-Smtp-Source: AMrXdXvtEvPEYWoZ0f7Fe2+oPQjlgmtPeXy4VZF3RjDLZ+zvzlJFCsGVs6p6MFOHfPEvL9oqgVQOdA==
X-Received: by 2002:a05:6402:548b:b0:49c:869e:6134 with SMTP id fg11-20020a056402548b00b0049c869e6134mr706953edb.8.1673596792363;
        Thu, 12 Jan 2023 23:59:52 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u9-20020a056402110900b00499d0d78540sm3381660edv.39.2023.01.12.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 23:59:51 -0800 (PST)
Date:   Fri, 13 Jan 2023 08:59:50 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Ido Schimmel <idosch@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] devlink: remove some unnecessary code
Message-ID: <Y8EPdjD3bXXp0M2Q@nanopsycho>
References: <Y8EJz8oxpMhfiPUb@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8EJz8oxpMhfiPUb@kili>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fri, Jan 13, 2023 at 08:35:43AM CET, error27@gmail.com wrote:
>This code checks if (attrs[DEVLINK_ATTR_TRAP_POLICER_ID]) twice.  Once
>at the start of the function and then a couple lines later.  Delete the
>second check since that one must be true.
>
>Because the second condition is always true, it means the:
>
>	policer_item = group_item->policer_item;
>
>assignment is immediately over-written.  Delete that as well.
>
>Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
