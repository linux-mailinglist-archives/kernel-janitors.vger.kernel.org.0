Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA57AFEAE
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 16:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfIKOZs (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 10:25:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36223 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfIKOZs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 10:25:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so10217312plr.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZY0VKmh52iD2w/hscg/E0okbbP/27tzLMXediCN3D/I=;
        b=Y1iXwFcj/tSvkOLjmRn9yK9p2K4x7mTHMx7QqXsjDfpYZCxq9EkCHq9niTIUOSPWZ8
         n/bAzXVNmJimZNLdlRMMCY8rxibHoqa4m/YcaPlkatYsy3Y3DdbJRsmyRpxEovyIiXDC
         qvHpjY7OMWTw/v7bohuTyp2eVJzjHchF/GmOn1Gaz1dD4bL2KZinks6HZ3BSYLKIHhbz
         m2oYhkS0TB53iGMUCu3rmpUw3qxYMZWWXSoxZTRSbi4cvX+i7ZjtuL7MX+loyYDpIhdC
         JwDHIRpY0gApulLqRWqixKUsFal8yjl7c0asNUmLCbKEP6nQ0u4bS53TtHwKYCMIb9EH
         C/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZY0VKmh52iD2w/hscg/E0okbbP/27tzLMXediCN3D/I=;
        b=a0avkkuOYzfOBZxQlpoHGkhXlZlmwQo+tAz3CyxTgRuG2kb47Ay9PkNzvFqi1Q8b5d
         daF3wJXm2aT7EhUIyxBUsVfmsixnQFh4wOemszUM7G0l09sSgYNFqGIKcpIAKMz9PW8W
         aNBHww3rwKecTNsTEQkz4WyTGNzx8RmpwsbOxuWm6lY7kujoFxu9K42NOpmMOgUdWg/P
         7Uw9GhcDiMPjuSHMmt1hM1UVsD2Qqrlxf0ffe+LiGfj0RDpg/fV5pzWl6XPc1dERbSOG
         G5qu0Exk25Dub9Wp4Q2b6O1bQIb7rSvhs58hI9a00nztw8q51vRfnAamwPQI+rKRKsCa
         oK4Q==
X-Gm-Message-State: APjAAAWLX+NlF3fUnkqgVRySaUTWdydUnMBoIsTAaSKMi4jEGcOpMM6i
        RC0w/Sztv1Vh8xPAD1ghexk=
X-Google-Smtp-Source: APXvYqzVagHGJCTsFdlnY89oOT1Wq55J7Q6/Kh15fBHzO92RrfYb3CzN4CGQK4Z4dqWRuIdI97AUjA==
X-Received: by 2002:a17:902:a615:: with SMTP id u21mr35951614plq.4.1568211947990;
        Wed, 11 Sep 2019 07:25:47 -0700 (PDT)
Received: from SARKAR ([1.186.0.68])
        by smtp.gmail.com with ESMTPSA id z21sm23107388pfn.183.2019.09.11.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 07:25:47 -0700 (PDT)
Date:   Wed, 11 Sep 2019 19:55:43 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dominic Braun <inf.braun@fau.de>,
        Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, rohitsarkar5398@gmail.com
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-ID: <20190911142543.GA9873@SARKAR>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 04:17:25PM +0200, Stefan Wahren wrote:
> Hi Rohit,
> 
> On 11.09.19 15:51, Rohit Sarkar wrote:
> > When the number of bytes to be printed exceeds the limit snprintf
> > returns the number of bytes that would have been printed (if there was
> > no truncation). This might cause issues, hence use scnprintf which
> > returns the actual number of bytes printed to buffer always
> >
> > Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
> thanks for your patch. Did you test your change on the Raspberry Pi?

Hey Stefan,
No I haven't done so as I thought this is a generic change?
Will that be necessary? 
I am relatively new to kernel development
Thanks,
Rohit
