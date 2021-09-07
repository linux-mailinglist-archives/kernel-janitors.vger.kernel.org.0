Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529644025E6
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Sep 2021 11:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244700AbhIGJGc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Sep 2021 05:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244433AbhIGJGE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:06:04 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E3FC061575
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 02:04:58 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id n34so4308367pfv.7
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JFUe0oUrwXqCwKq4eqExlpRTi7IcVmkvmbvLDysmvKo=;
        b=BM7dGvd6Edcau63BuGqiLd8+YnWfnHHq3n8PkRi2eHP4MY0vVmyklJSWzZQtTeAOqL
         l5M2tJsNU/fU56sXnaI2CDdb42JjQsjUzEeT0sfLl/aqBDnDXRG/1IM+65SjU/ZtoR9X
         m+lOMWM/YlDFXbJGxlQfPdkshPIerdR4LYZrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JFUe0oUrwXqCwKq4eqExlpRTi7IcVmkvmbvLDysmvKo=;
        b=Hz7nc1VoL6K3Y99wuS5hFIsiu5tRDht/JUJ8j+1fh0Z7+nD4LXbBTgqGKsHHNX7VAH
         fRb1F0kstCfEy0xWw8EUQPmJbdvv5Ms0SlfAKSu8qeGOcMCN9S5KWEWHZKGuOmMNIU+f
         IJZ3De4a6QMgqOf6rJmkCWzd4K9NvHBc6p+RqxLGl3n4E+Q6jI0HgQD+pmV5otJTXJxq
         De+h342A1T+Gt0LZu6yFQ4G8JasJ1IUEiEVzSn32BCawCIF16G3g/um9Oaqhng/PZSY8
         U9VUKTRxUrTUJhLVZ5C8GRXS08FlZgAOnt/Hw7s/2CSpez8sEsvoy+p27Xr8foDE04eu
         5P1g==
X-Gm-Message-State: AOAM533nhJBF2yD+JpXCDSymxCh0UOf7m0JU5Evrvjj1e9Z7hRQbtZSU
        OiUD8G7mgr7Oz8/W0HXzn9NZRA==
X-Google-Smtp-Source: ABdhPJzx8/3ISOCaLAV2Ny8T7f+2UxkdQZswsuLsvQcXhjD4hcDtp/JeCFZl/QG2ac5GMuFxjiUXaw==
X-Received: by 2002:a62:28c:0:b0:405:397f:5c9e with SMTP id 134-20020a62028c000000b00405397f5c9emr15386576pfc.74.1631005497656;
        Tue, 07 Sep 2021 02:04:57 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4040:44a5:1453:e72c])
        by smtp.gmail.com with ESMTPSA id 73sm10503064pfu.92.2021.09.07.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 02:04:57 -0700 (PDT)
Date:   Tue, 7 Sep 2021 18:04:53 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ksmbd: potential uninitialized error code in
 set_file_basic_info()
Message-ID: <YTcrNUmL+WmV3prK@google.com>
References: <20210907073340.GC18254@kili>
 <YTccRzi/j+7t2eB9@google.com>
 <20210907084851.GL1957@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907084851.GL1957@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On (21/09/07 11:48), Dan Carpenter wrote:
> On Tue, Sep 07, 2021 at 05:01:11PM +0900, Sergey Senozhatsky wrote:
> > 
> >                rc = setattr_prepare(user_ns, dentry, &attrs);
> >                if (rc)
> >                         return -EINVAL;
> > 
> > Either it should be used more, and probably be a return value, or we can
> > just remove it.
> 
> You are looking at old code from before the bug was introduced.

Right. I fetched today's linux-next and see the point now.
