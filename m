Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECE8B24AA
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Sep 2019 19:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388030AbfIMRi3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Sep 2019 13:38:29 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:46161 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbfIMRi3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Sep 2019 13:38:29 -0400
Received: by mail-pl1-f180.google.com with SMTP id t1so13529351plq.13;
        Fri, 13 Sep 2019 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=qYty8ZGSHfzoRsuWFqeVeH4Tw+tK1EF9L4qW5sJv1kg=;
        b=ZJsalVS3PbT4TGOv/TU3bYbbTujSQP8G/n3auGHrjOxqjcXY5K+rtZuI+ycCQMllFK
         odZJOlwh4cdfVcCRGd9HBh/CVSB2ULTh9WtEYp/H0aaLkFkgrgktGUZy0maz9fjUmGOy
         dIFCJ1ymMSfzDbLNoEEoSkQRjnF4vwNUY+RQ/DRU5UXMxpwfD6ooF0QOAnorTJRdR/zg
         WXCIUIiiApvtmOMX1a+GHXx3Dec9T+GW3BAE6ATeaDBgHuowUOS9yP4VoV5cGhcAolA6
         vjp5RbS/pbaHmhPfl8pN2J7msGXoNsaQi8lZ4PScDmDk2A47SH6sRzpiIUGeisNNrR5P
         R8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qYty8ZGSHfzoRsuWFqeVeH4Tw+tK1EF9L4qW5sJv1kg=;
        b=HYz+kkYaIe1sZAT3h7+67S9OfiefYSUPYyK32FHkqpw7jOcDE2+Y9B9cv5wuJusGp1
         XnwUQTWbS/G5xXYa8Ef/GIgdwOR2fi8jU7s547NbsnPlWNsBZb6N+tHXI1WqefXISspT
         fXWCoDLGb3U8mgdB6giUG4SMFUfh4WD6nd79wpZPHtz4RJxmsGis8HdhfawS3Uc9iF6h
         ooJxhVimuadW40W/LPo87CVkhX20KBREg0wbDZUPHz0EfS2G3BmYqwo4A+4DsfAxgf9i
         izEdDTiMb8UBeWSHfIBzYCJEZenOCjQ6/ZMr4jmFKUOtvkHYfoopE/8TdeSbJbNWjH5X
         Ss+g==
X-Gm-Message-State: APjAAAV+/jvWN7MvK6oan9d3DuxDrxLkjvbsg7WByftcbZZzOkEtYxO+
        IbDGSNRqnkQhARWGWsPWQZnwvDz3hF8=
X-Google-Smtp-Source: APXvYqwRYQhH5FW/K5a8S1dflvdM8MwW2jPjeqjLgSdjSWZ2S1c7o2E1O4ahJ/KPFuT80nemLUXixQ==
X-Received: by 2002:a17:902:ac8d:: with SMTP id h13mr48671899plr.273.1568396306306;
        Fri, 13 Sep 2019 10:38:26 -0700 (PDT)
Received: from SARKAR ([1.186.12.73])
        by smtp.gmail.com with ESMTPSA id 62sm27015940pfg.164.2019.09.13.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 10:38:25 -0700 (PDT)
Date:   Fri, 13 Sep 2019 23:08:21 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     linux-newbie@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: Problems during compiling in kernel modules
Message-ID: <20190913173821.GA5986@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,
I was trying to compile a particular folder in my kernel tree.

AFAIK the way to do this is:
`make drivers/staging/iio/` from the kernel base directory.

This gives me the following output:
`
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
`

No object files are generated.
I feel like I am missing something.

Thanks,
Rohit
