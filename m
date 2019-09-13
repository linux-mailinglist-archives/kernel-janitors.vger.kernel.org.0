Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841D0B21F1
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbfIMO3W (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 10:29:22 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:44481 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfIMO3V (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 10:29:21 -0400
Received: by mail-pg1-f182.google.com with SMTP id i18so15330662pgl.11
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2019 07:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9EHPf8eizXh8fYus8AQqvm80tDa6xLcvnLBw84dQuJA=;
        b=PoAEK4vqKJxUHpnXXMSHaLH24OCj+B5JfRp5jNSSwIfu1qXaYq8rZ2n7VCSSQnLABJ
         jHxprKaPDNOH/sys82wgrqnVdB3CEk90Er6VfcYPabcu5Qm+v4gOMHPNoJYp8DJzWAIX
         dGSdcyQXt3035ZAvzpAHWg77ZK578EVrcEv33xSPR7HXqqcVKd7NecfBND36I9yOqBYx
         UlpCz9fewGLGVzIt2z6E/0D5nIgrFYoqFflSQEmMd0nRao/pFFnbYFAtrkvWZ1kOvKmR
         MgN3TlyU7ozK6dJV5WctBW4MNc0J0YWXzd4GG0lnET9VtZPKCVp1TQN8ZDVHqQRxXxrj
         UTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9EHPf8eizXh8fYus8AQqvm80tDa6xLcvnLBw84dQuJA=;
        b=XOocYvYBxvZXvaeblPQSdD5vTvEF3su/YV7FidMRK4S6W44Jm2QGPb8oJxKPM30aqw
         qMTr5TRr/SVM08FLRJ/T5iLuDpTWoSaFLg/OR+ab0DGFLHwokbaAMnGYOJ9DUDjYZKvG
         W1sk79yfnsqMSuIESHOQHI2MqXQ7krNQDQVx0mC2nF4UodY5UX0dUJG4TQZRoXe++aHS
         UoRzeBcSHQXc/XUMaiOLa/IK6P3hwKmooYk2xQlZRgtKdTCthjlNQT7BzatCrd/YFf73
         klPN6LySGXMNebxQxZZ2lo73a6OR8WR+aX5HKhKZKuQSoNAzhfnBS5q4QDu1xU2cgEcm
         IHHQ==
X-Gm-Message-State: APjAAAVSfpVccFs+ZFxcIMK8YPSPrEY8FZLNv19Z6ISVeBYayPYfb3QD
        N2wl3hQXl+qXTofavzBLlKg=
X-Google-Smtp-Source: APXvYqzC2LhaPYK6wwwqTFfur5CG6AAbsVbsrN16sOEiQC7OoPbIOqe+st2AJT3eR7K3lVy5e4WR3A==
X-Received: by 2002:a17:90a:c587:: with SMTP id l7mr5372720pjt.25.1568384960904;
        Fri, 13 Sep 2019 07:29:20 -0700 (PDT)
Received: from SARKAR ([1.186.12.73])
        by smtp.gmail.com with ESMTPSA id c128sm18857248pfc.166.2019.09.13.07.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:29:20 -0700 (PDT)
Date:   Fri, 13 Sep 2019 19:59:16 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: Queries of an aspiring kernel developer
Message-ID: <20190913142916.GB309@SARKAR>
References: <20190912142517.GA22751@SARKAR>
 <20190913132310.GQ20699@kadam>
 <20190913141935.GA309@SARKAR>
 <alpine.DEB.2.21.1909131623300.2767@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909131623300.2767@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 13, 2019 at 04:24:37PM +0200, Julia Lawall wrote:
> 
> Dan's suggestions are fine.  You may want to take a fairly recent driver
> from staging (to check using git log) to be sure that the work has not
> already been done by others.
> 
> julia

Sure, thanks julia.

regards,
Rohit
